import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/data/common/constants.dart';
import 'package:flutter_api_call_dio/src/widgets/item_movie_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../res/app_color.dart';
import '../../res/strings.dart';
import '../../utils/log_util.dart';
import '../../utils/my_application.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_progress_view.dart';

final title = "MovieTab";

class MovieTab extends StatefulWidget {
  @override
  _MovieTabState createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab> {
  @override
  void initState() {
    super.initState();
    app.appController.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomProgressView(
        isLoading: app.appController.isLoadingIndex(2),
        progressIndicator: SpinKitWave(color: appColor.white, size: 80.w),
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
      );
    });
  }

  _buildAppBar() {
    return CustomAppBar(
      showLeadingArrow: false,
      centerTitle: false,
      showTitleSpacing: true,
      title: strings.popular_movies,
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 25.h, bottom: 230.h),
      itemCount: app.appController.popularMoviesList.length,
      itemBuilder: (context, index) {
        final data = app.appController.popularMoviesList[index];
        return ItemMovieList(data);
      },
    );
  }
}
