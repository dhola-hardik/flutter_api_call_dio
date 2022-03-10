import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetUtil {
  static WidgetUtil? _instance;

  WidgetUtil._() {}

  factory WidgetUtil() {
    if (_instance == null) {
      _instance = new WidgetUtil._();
    }
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

  static int rotateH() {
    return 1;
  }

  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width.w);
  }

  static Widget spaceHorizontal2(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceVertical(double height) {
    return SizedBox(height: height.h);
  }

  static Widget spaceVertical2(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), height: 0.5);
  }

  static Widget verticalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), width: 0.5);
  }

  static Widget verticalGreyLine1() {
    return Container(color: Colors.grey, width: 0.5);
  }
}
