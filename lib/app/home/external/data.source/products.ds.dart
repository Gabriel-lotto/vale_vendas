import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vale_vendas/app/home/infra/data.source/i.products.ds.dart';
import 'package:vale_vendas/app/shared/api/client/client.interface/i.client.api.dart';
import 'package:vale_vendas/app/shared/api/routes.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';
import 'package:vale_vendas/app/shared/models/product.dart';

class ProductsDS extends IProductsDS {
  final ClientApi _api;

  ProductsDS(this._api);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      var response = await _api.get(ValeVendasRoutes.getProducts);

      return response.fold(
        (l) => throw l,
        (r) => Right(
          (r.data as List)
              .map<Product>(
                (json) => Product.fromJson(json),
              )
              .toList(),
        ),
      );
    } on DioException catch (e) {
      switch (e.error.runtimeType) {
        case UnexpectedError _:
          return left(
            UnexpectedError(
              message: e.message.toString(),
              label: '',
              exception: e,
              stacktrace: e.stackTrace,
            ),
          );
        case ConnectionError _:
          return left(
            ConnectionError(
              message: e.message.toString(),
              label: '',
              exception: e,
              stacktrace: e.stackTrace,
            ),
          );
        default:
          return left(
            UnexpectedError(
              message: e.message.toString(),
              label: '',
              exception: e,
              stacktrace: e.stackTrace,
            ),
          );
      }
    }
  }
}
