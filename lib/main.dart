import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'init_app.dart';
import 'res/strings.dart';
import 'src/home_page.dart';
import 'utils/theme_util.dart';

void main() async {
  await initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: strings.app_name,
          theme: appTheme,
          defaultTransition: Transition.cupertino,
          home: HomePage(),
        );
      },
    );
  }
}
