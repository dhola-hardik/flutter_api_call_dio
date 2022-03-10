import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/models/movie_details_model.dart';
import 'package:flutter_api_call_dio/res/app_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/date_utils.dart';
import '../../utils/my_application.dart';
import '../../utils/widget_util.dart';

class ItemMovieList extends StatelessWidget {
  final MovieDetailsModel data;

  ItemMovieList(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 60.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 50.w,
                // bottom: -50.w,
                left: 0,
                right: 0,
                child: Container(
                  constraints: BoxConstraints(minHeight: 0.29.sw),
                  padding:
                      EdgeInsets.only(top: 30.h, bottom: 20.h, left: 0.30.sw),
                  decoration: BoxDecoration(
                      color: appColor.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: data.originalTitle ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 42.sp,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  " (${dateUtils.formattedDate(data.releaseDate!, dateUtils.Format_6)})",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      WidgetUtil.spaceVertical(15),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: (data.voteAverage * 0.5),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            unratedColor: Colors.grey,
                            itemSize: 50.w,
                            itemCount: 5,
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) {},
                          ),
                          WidgetUtil.spaceHorizontal(10),
                          Text("${data.voteAverage}",
                              style: TextStyle(
                                  color: appColor.main,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w800)),
                          WidgetUtil.spaceHorizontal(10),
                          Text("(${data.voteCount})",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      WidgetUtil.spaceVertical(15),
                      Text(
                          "${app.appController.getGenreNames(data.genreIds ?? [])}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w400)),
                      WidgetUtil.spaceVertical(15),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 3.w),
                        decoration: BoxDecoration(
                            color: appColor.main,
                            borderRadius: BorderRadius.circular(3)),
                        child: Text("${data.originalLanguage!.toUpperCase()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 30.sp)),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.only(left: 30.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: appColor.main,
                child: ExtendedImage.network(
                  data.posterPath ?? "",
                  width: 0.24.sw,
                  height: 0.30.sw,
                  cache: true,
                  fit: BoxFit.cover,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
