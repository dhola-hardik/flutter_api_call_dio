import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/models/movie_details_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/widget_util.dart';

class ItemHomeMovie extends StatelessWidget {

  final MovieDetailsModel data;

  ItemHomeMovie(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          ExtendedImage.network(
            data.backdropPath ?? "",
            // height: double.infinity,
            cache: true,
            fit: BoxFit.cover,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.1),
            colorBlendMode: BlendMode.darken,
          ),
          Positioned(
            left: 50.w,
            bottom: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w500)),
                WidgetUtil.spaceVertical(5),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: (data.voteAverage * 0.5),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemSize: 40.w,
                      itemCount: 5,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {},
                    ),
                    WidgetUtil.spaceHorizontal(10),
                    Text("(${data.voteCount})",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
