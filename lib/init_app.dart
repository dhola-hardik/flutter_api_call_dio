import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/bindings/app_binding.dart';
import 'utils/my_application.dart';

Future<void> initApp() async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    binding.renderView.automaticSystemUiAdjustment = false;
  }

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  AppBinding().dependencies();
}
