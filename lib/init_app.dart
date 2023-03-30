import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/bindings/app_binding.dart';
import 'utils/my_application.dart';

Future<void> initApp() async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && Platform.isAndroid) {
    binding.renderView.automaticSystemUiAdjustment = false;
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  AppBinding().dependencies();
}
