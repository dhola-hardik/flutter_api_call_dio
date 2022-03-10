import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_api_call_dio/api/api_params.dart';
import 'package:flutter_api_call_dio/models/genre_response.dart';
import 'package:flutter_api_call_dio/models/movie_response.dart';
import 'package:flutter_api_call_dio/models/product_response.dart';

import '../../models/product_model.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

final title = "ApiRepo";

class ApiRepo {
  Future<ProductResponse?> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ProductResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.products;

    try {
      final response = await apiUtils.get(url: url);

      if (response != null) {
        List<ProductModel> products = List<ProductModel>.from(
            response.data.map((x) => ProductModel.fromJson(x)));

        return ProductResponse(success: true, productList: products);
      }

      return ProductResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return ProductResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future<MovieResponse?> getPopularMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return MovieResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrlMovies + ApiEndPoints.popularMovies;
    Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      return MovieResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future<MovieResponse?> getUpcomingMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return MovieResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrlMovies + ApiEndPoints.upcomingMovies;
    Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      return MovieResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future<GenreResponse?> getGenreList() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return GenreResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrlMovies + ApiEndPoints.getGenreList;
    Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);
      return GenreResponse.fromJson(response.data);
    } catch (e) {
      return GenreResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }
}
