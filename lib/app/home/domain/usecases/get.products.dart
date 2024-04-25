import 'package:dartz/dartz.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';
import 'package:vale_vendas/app/shared/models/product.dart';

import '../repositories/i.products.repository.dart';

class GetProducts {
  final IProductsRepository _repository;

  GetProducts(this._repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await _repository.getProducts();
  }
}
