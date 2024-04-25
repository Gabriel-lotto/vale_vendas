import 'package:flutter/material.dart';

class AppConfig {
  static AppConfig? _instance;

  late GlobalKey<NavigatorState> navigatorKey;

  AppConfig._();

  static AppConfig get instance {
    _instance ??= AppConfig._();
    return _instance!;
  }

  void dispose() {
    _instance = null;
  }
}
