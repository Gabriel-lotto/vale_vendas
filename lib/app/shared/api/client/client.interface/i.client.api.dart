import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';

abstract interface class ClientApi {
  Future<Either<Failure, Response>> get(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
