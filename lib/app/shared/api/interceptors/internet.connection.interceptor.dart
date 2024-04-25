import 'dart:io';

import 'package:dio/dio.dart';

import '../../../shared/errors/failure.dart';

class InternetConnectionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var hasConnection = await _checkInternetConnection();
    if (!hasConnection) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: ConnectionError(),
        ),
      );
    } else {
      super.onRequest(options, handler);
    }
  }

  /// Realiza a verificação da conexão com a internet
  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException {
      return false;
    } on Exception {
      return false;
    }

    return false;
  }
}
