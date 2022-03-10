import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/controllers/app_controller.dart';
import 'package:flutter_api_call_dio/data/common/params_args.dart';
import 'package:get/get.dart';

MyApplication app = MyApplication();

class MyApplication {
  static final MyApplication _myApplication = MyApplication._i();
  AppController _appController = Get.find(tag: ParamsArgus.APP);

  factory MyApplication() {
    return _myApplication;
  }

  MyApplication._i() {}

  AppController get appController {
    return _appController;
  }
}
