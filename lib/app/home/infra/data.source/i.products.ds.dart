import 'package:dartz/dartz.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';
import 'package:vale_vendas/app/shared/models/product.dart';

abstract class IProductsDS {
  Future<Either<Failure, List<Product>>> getProducts();
}
