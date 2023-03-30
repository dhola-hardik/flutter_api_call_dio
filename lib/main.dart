import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'init_app.dart';
import 'res/strings.dart';
import 'src/home_page.dart';
import 'utils/theme_util.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: (ctx, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: strings.app_name,
          theme: appTheme,
          defaultTransition: Transition.cupertino,
          // home: HomePage(),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => HomePage()),
          ],
        );
      },
    );
  }
}
