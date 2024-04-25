import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app.config.dart';

import 'app.module.dart';
import 'app.widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.navigatorKey = GlobalKey<NavigatorState>();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
