import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app/home/presenter/widgets/product.shimmer.widget.dart';
import 'package:vale_vendas/app/home/presenter/widgets/product.widget.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';
import 'package:vale_vendas/app/shared/widgets/body.widget.dart';
import 'package:vale_vendas/app/shared/widgets/primary.button.widget.dart';

import '../stores/home.store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    Future.microtask(() => store.getProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return store.productList.isNotEmpty
            ? BodyWidget(
                bottomSheet: PrimaryButtonWidget(
                  label: 'Cadastrar desconto',
                  onTap: () {
                    Modular.to.pushNamed(
                      'product/edit-product',
                      arguments: {
                        'isEditPage': false,
                        'product': null,
                      },
                    );
                  },
                ),
                pageTitle: 'Descontos',
                showBackButton: false,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: store.productList.length,
                        itemBuilder: (context, index) {
                          final product = store.productList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0, left: 20, right: 20),
                            child: ProductWidget(
                              product: product,
                              percentual: '3%',
                              switchValue: product.id % 2 == 0,
                              onTapButton: () {
                                Modular.to.pushNamed(
                                  'product',
                                  arguments: product,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Container(height: 108.h),
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () => store.getProducts(),
                child: BodyWidget(
                  showAppBar: false,
                  pageTitle: 'Descontos',
                  showBackButton: false,
                  child: Column(
                    children: [
                      Container(height: 15.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 16.0, left: 20, right: 25),
                              child: ProductShimmerWidget(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
