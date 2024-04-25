import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app/home/home.module.dart';
import 'package:vale_vendas/app/shared/api/client/client.impl.dart/client.impl.dart';
import 'package:vale_vendas/app/shared/api/client/client.interface/i.client.api.dart';
import 'package:vale_vendas/app/shared/api/interceptors/internet.connection.interceptor.dart';
import 'package:vale_vendas/app/shared/utils/response.log.improvement.dart';

import 'app/splash/view/splash.page.dart';

class AppModule extends Module {
  Dio get _dio {
    final dio = Dio();
    dio.interceptors.add(InternetConnectionInterceptor());
    dio.interceptors.add(DioLogger());

    return dio;
  }

  @override
  void exportedBinds(Injector i) {
    i.addInstance<Dio>(_dio);
    i.add<ClientApi>(ClientApiImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/home', module: HomeModule());
  }
}
