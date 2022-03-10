import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/data/common/constants.dart';
import 'package:flutter_api_call_dio/res/app_color.dart';
import 'package:flutter_api_call_dio/src/widgets/item_home_movie.dart';
import 'package:flutter_api_call_dio/utils/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:flutter_api_call_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../api/repository/api_repository.dart';
import '../../models/movie_details_model.dart';
import '../../res/strings.dart';
import '../../utils/log_util.dart';
import '../../utils/my_application.dart';
import '../../widgets/custom_appbar.dart';
import '../widgets/item_product.dart';

final title = "HomeTab";

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isLoadingMovie = false;
  List<MovieDetailsModel> _upcomingMoviesList = [];

  @override
  void initState() {
    super.initState();
    _getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return CustomAppBar(
      showLeadingArrow: false,
      centerTitle: false,
      showTitleSpacing: true,
      title: strings.home_title,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetUtil.spaceVertical(40),
          _buildMovies(),
          WidgetUtil.spaceVertical(25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70.w),
            child: Text(strings.products,
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600)),
          ),
          Obx(() {
            if (app.appController.isLoading) {
              return Container(
                height: 0.5.sh,
                child: SpinKitWave(color: appColor.main, size: 70.w),
              );
            }

            return Container(
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(
                    top: 20.w, bottom: 230.h, left: 60.w, right: 60.w),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2,
                  crossAxisSpacing: 40.w,
                  mainAxisSpacing: 40.w,
                  height: 0.28.sh,
                ),
                itemCount: app.appController.productsList.length,
                itemBuilder: (context, index) {
                  final data = app.appController.productsList[index];
                  return ItemProduct(index: index, data: data);
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMovies() {
    if (_isLoadingMovie) {
      return Container(
        height: 0.25.sh,
        child: SpinKitWave(color: appColor.main, size: 70.w),
      );
    }

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 0.24.sh,
        viewportFraction: 0.75,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 1500),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
      itemCount: _upcomingMoviesList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final data = _upcomingMoviesList[itemIndex];
        return ItemHomeMovie(data);
      },
    );
  }

  void _getUpcomingMovies() async {
    _isLoadingMovie = true;
    setState(() {});

    try {
      final result = await ApiRepo().getUpcomingMovies();
      Log.loga(title, "_getUpcomingMovies:: result >>>>> ${result!.toJson()}");

      _isLoadingMovie = false;
      setState(() {
        if (result != null) {
          if (result.isSuccess()) {
            _upcomingMoviesList = result.results ?? [];
          } else {
            constants.showSnackbar(
                "Api Error Response", "error:: ${result.statusMessage}");
          }
        }
      });
    } catch (e) {
      Log.loga(title, "_getUpcomingMovies:: e >>>>> $e");
      _isLoadingMovie = false;
      constants.showSnackbar("Api Error", "error:: $e");
    }
  }
}
