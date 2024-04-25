import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';

import '../client.interface/i.client.api.dart';

class ClientApiImpl implements ClientApi {
  final Dio _dio;
  ClientApiImpl(this._dio);

  @override
  Future<Either<Failure, Response>> get(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio
        .get(
          url,
          data: data,
          queryParameters: queryParameters,
        )
        .then<Either<Failure, Response>>(right);
  }
}
