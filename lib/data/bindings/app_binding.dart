import 'package:flutter_api_call_dio/controllers/app_controller.dart';
import 'package:flutter_api_call_dio/data/common/params_args.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), tag: ParamsArgus.APP, fenix: true);
  }
}
