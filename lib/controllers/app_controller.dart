import 'dart:convert';

import 'package:flutter_api_call_dio/api/repository/api_repository.dart';
import 'package:flutter_api_call_dio/models/movie_details_model.dart';
import 'package:flutter_api_call_dio/models/product_model.dart';
import 'package:flutter_api_call_dio/utils/log_util.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../api/repository/base_repository.dart';
import '../data/common/constants.dart';
import '../models/genre_model.dart';

final title = "AppController";

class AppController extends GetxController {
  final _selectedTabIndex = 0.obs;
  final _isLoading = false.obs;

  // final RxBool _isLoading = false.obs;
  final _isLoadingIndex = <int, bool>{}.obs;
  final _productsList = <ProductModel>[].obs;
  final _popularMoviesList = <MovieDetailsModel>[].obs;
  final _genresList = <GenreModel>[].obs;

  var _favCount = 0.obs;

  int get selectedTabIndex => _selectedTabIndex.value;

  bool get isLoading => _isLoading.value;

  bool isLoadingIndex(int index, [bool defaultValue = false]) =>
      _isLoadingIndex.value[index] ?? defaultValue;

  List<ProductModel> get productsList => _productsList.value;

  List<MovieDetailsModel> get popularMoviesList => _popularMoviesList.value;

  List<GenreModel> get genresList => _genresList.value;

  int get favCount => _favCount.value;

  @override
  void onInit() {
    Log.loga(title, "onInit:: >>>>>>> ");
    getGenreList();
    super.onInit();
  }

  void onTabChanged(int index) {
    _selectedTabIndex.value = index;
  }

  void setLoading(bool show) {
    _isLoading.value = show;
    // _isLoading(true);
  }

  void setLoadingIndex(int key, bool show) {
    _isLoadingIndex.update(key, (dynamic val) => show, ifAbsent: () => show);
  }

  void getProducts() async {
    setLoading(true);
    try {
      final result = await ApiRepo().getProducts();
      // Log.loga(title, "getProducts:: result >>>>> ${result!.toJson()}");

      setLoading(false);
      if (result != null) {
        if (result.isSuccess) {
          _productsList.value = result.productList ?? [];
        } else {
          constants.showSnackbar(
              "Api Error Response", "error:: ${result.message}");
        }
      }
    } catch (e) {
      Log.loga(title, "getProducts:: e >>>>> $e");
      setLoading(false);
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }

  // 2nd way to get products list
  void getProducts2() async {
    setLoading(true);
    try {
      String url = Api.baseUrl + "products";

      final result = await BaseRepo().get(apiURL: url);
      Log.loga(title, "getProducts2:: result >>>>> $result");

      setLoading(false);
      if (result != null) {
        List<ProductModel> products = List<ProductModel>.from(
            result.map((x) => ProductModel.fromJson(x)));
        _productsList.value = products;
      }
    } catch (e) {
      Log.loga(title, "getProducts2:: e >>>>> $e");
      setLoading(false);
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }

  void getPopularMovies() async {
    setLoadingIndex(2, true);
    try {
      final result = await ApiRepo().getPopularMovies();
      Log.loga(title, "getPopularMovies:: result >>>>> ${result!.toJson()}");

      setLoadingIndex(2, false);
      if (result != null) {
        if (result.isSuccess()) {
          _popularMoviesList.value = result.results ?? [];
        } else {
          constants.showSnackbar(
              "Api Error Response", "error:: ${result.statusMessage}");
        }
      }
    } catch (e) {
      Log.loga(title, "getPopularMovies:: e >>>>> $e");
      setLoadingIndex(2, false);
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }

  void getGenreList() async {
    try {
      final result = await ApiRepo().getGenreList();
      Log.loga(title, "getGenreList:: result >>>>> ${result!.toJson()}");

      if (result != null) {
        if (result.isSuccess()) {
          _genresList.value = result.genres ?? [];
        }
      }
    } catch (e) {
      Log.loga(title, "getGenreList:: e >>>>> $e");
    }
  }

  String getGenreNames(List<int> ids) {
    List<String> list = [];
    ids.forEach((id) {
      GenreModel genre = _genresList.firstWhere((element) => element.id == id);
      list.add(genre.name ?? "");
      /*_genresList.forEach((genre) {
        if (genre.id == id) {
          list.add(genre.name ?? "");
        }
      });*/
    });
    return list.join(", ");
  }

  void updateQty({required ProductModel product, bool isAdd = true}) {
    int index = _productsList.indexOf(product);
    if (isAdd) {
      product.qty++;
      _productsList[index] = product;
    } else {
      product.qty--;
      _productsList[index] = product;
    }
  }

  void setFavourite({required ProductModel product, required bool fav}) {
    product.isFav = fav;
    _productsList[_productsList.indexOf(product)] = product;
    if (fav) {
      _favCount++;
    } else {
      _favCount--;
    }
  }
}
