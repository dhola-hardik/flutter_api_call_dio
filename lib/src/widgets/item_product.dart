import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/models/product_model.dart';
import 'package:flutter_api_call_dio/res/app_color.dart';
import 'package:flutter_api_call_dio/utils/my_application.dart';
import 'package:flutter_api_call_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../res/strings.dart';

class ItemProduct extends StatelessWidget {
  final int index;
  final ProductModel data;

  ItemProduct({required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: ExtendedImage.network(data.image ?? "", cache: true),
                  ),
                  if (index % 3 == 0)
                    Positioned(
                      top: 30.w,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.w),
                        decoration: BoxDecoration(
                            color: appColor.pink,
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(strings.special,
                            style: TextStyle(
                                color: Colors.white, fontSize: 28.sp)),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    child: MaterialButton(
                      onPressed: () {
                        app.appController
                            .setFavourite(product: data, fav: !data.isFav);
                      },
                      minWidth: 0,
                      padding: EdgeInsets.all(10),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.favorite_rounded,
                        color: data.isFav ? Colors.red : Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
              child: Text(data.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40.w, top: 10.w, bottom: 10.w),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_rate_rounded,
                                color: Colors.orange, size: 45.w),
                            WidgetUtil.spaceHorizontal(5),
                            Text("${data.rating!.rate}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500)),
                            Text("(${data.rating!.count})",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        WidgetUtil.spaceVertical(10),
                        Text("\$${data.price}",
                            style: TextStyle(
                                color: appColor.main,
                                fontSize: 48.sp,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  minWidth: 0,
                  color: appColor.main,
                  padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 40.w),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Icon(Icons.shopping_cart_outlined, size: 45.w, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
