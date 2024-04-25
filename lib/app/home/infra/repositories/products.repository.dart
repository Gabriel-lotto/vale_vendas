import 'package:dartz/dartz.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';
import 'package:vale_vendas/app/shared/models/product.dart';

import '../../domain/repositories/i.products.repository.dart';
import '../data.source/i.products.ds.dart';

class ProductsRepository extends IProductsRepository {
  final IProductsDS _ds;

  ProductsRepository(this._ds);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      var result = await _ds.getProducts();
      return result;
    } on Failure catch (e) {
      return Left(e);
    } on Exception {
      return Left(UnexpectedError());
    }
  }
}
