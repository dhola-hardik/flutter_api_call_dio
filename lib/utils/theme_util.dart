import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/res/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle titleStyle = TextStyle(
    color: Colors.black, fontSize: 48.sp, fontWeight: FontWeight.w600);

ThemeData appTheme = ThemeData(
  backgroundColor: appColor.bgColor,
  scaffoldBackgroundColor: appColor.bgColor,
  appBarTheme: AppBarTheme(
      color: appColor.main, iconTheme: IconThemeData(color: appColor.white)),
  primaryTextTheme: TextTheme(bodyText2: TextStyle(color: appColor.white)),
  textTheme: TextTheme(bodyText2: TextStyle(color: appColor.black)),
  primaryColor: appColor.primaryColor,
  primaryColorDark: appColor.primaryDarkColor,
  primaryColorLight: appColor.primaryLight,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(buttonColor: appColor.black),
);
