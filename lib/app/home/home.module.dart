import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app.module.dart';
import 'package:vale_vendas/app/home/domain/repositories/i.products.repository.dart';
import 'package:vale_vendas/app/home/domain/usecases/get.products.dart';
import 'package:vale_vendas/app/home/external/data.source/products.ds.dart';
import 'package:vale_vendas/app/home/infra/data.source/i.products.ds.dart';
import 'package:vale_vendas/app/home/infra/repositories/products.repository.dart';
import 'package:vale_vendas/app/home/presenter/pages/product/product.details.page.dart';
import 'package:vale_vendas/app/home/presenter/pages/product/product.discount.page.dart';
import 'package:vale_vendas/app/home/presenter/stores/product/product.discount.store.dart';
import 'package:vale_vendas/app/shared/models/product.dart';

import 'presenter/pages/home.page.dart';
import 'presenter/stores/home.store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    // Repository
    i.addLazySingleton<IProductsRepository>(ProductsRepository.new);

    // External
    i.addLazySingleton<IProductsDS>(ProductsDS.new);

    // Store
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton(ProductDiscountStore.new);

    //UseCase
    i.addLazySingleton(GetProducts.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        transition: TransitionType.rightToLeft,
        child: (context) => const HomePage(),
      )
      ..child(
        '/product',
        transition: TransitionType.rightToLeft,
        child: (context) => ProductDetailsPage(
          product: r.args.data as Product,
        ),
      )
      ..child(
        '/product/edit-product',
        transition: TransitionType.rightToLeft,
        child: (context) => ProductEditDiscountPage(
          isEditPage: r.args.data['isEditPage'] as bool,
          product: r.args.data['product'] as Product?,
        ),
      );
  }
}
