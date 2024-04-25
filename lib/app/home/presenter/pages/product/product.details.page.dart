import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app/shared/models/product.dart';
import 'package:vale_vendas/app/shared/utils/colors.default.dart';
import 'package:vale_vendas/app/shared/utils/price_extension.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';
import 'package:vale_vendas/app/shared/widgets/body.widget.dart';
import 'package:vale_vendas/app/shared/widgets/primary.button.widget.dart';
import 'package:vale_vendas/app/shared/widgets/switch.widget.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      bottomSheet: PrimaryButtonWidget(
        label: 'Editar desconto',
        onTap: () {
          Modular.to.pushNamed(
            'product/edit-product',
            arguments: {
              'isEditPage': true,
              'product': widget.product,
            },
          );
        },
      ),
      pageTitle: "Detalhe do desconto",
      showAppBar: true,
      showBackButton: true,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SwitchWidget(
                switchValue: true,
                onChanged: (_) {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 16.h),
                Center(
                  child: Container(
                    height: 335.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(widget.product.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(height: 24.h),
                const _ProductDetailPrice(
                  containerHeight: 19,
                  productDetail: "Desconto de 10%",
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(height: 8.h),
                Row(
                  children: [
                    _ProductDetailPrice(
                      productDetail: widget.product.price.toCurrency(),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _ProductDetailPrice(
                      productDetail: widget.product.price.toCurrency(),
                      showContainerColor: false,
                      textStyle: TextStyle(
                        color: ColorsDefault.primaryTextBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Container(height: 8.h),
                SizedBox(
                  width: 260.w,
                  child: Text(
                    widget.product.title,
                    style: TextStyle(
                      color: ColorsDefault.primaryTextBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(height: 8.h),
                SizedBox(
                  width: 300.w,
                  child: Text(
                    widget.product.description,
                    style: TextStyle(
                      color: ColorsDefault.secondaryTextBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 150.h)
        ],
      ),
    );
  }
}

class _ProductDetailPrice extends StatelessWidget {
  final String productDetail;
  final TextStyle textStyle;
  final bool showContainerColor;
  final double containerHeight;

  const _ProductDetailPrice({
    required this.productDetail,
    required this.textStyle,
    this.showContainerColor = true,
    this.containerHeight = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight.h,
      padding: const EdgeInsets.all(3),
      decoration: showContainerColor
          ? BoxDecoration(
              color: ColorsDefault.primaryBlue,
              borderRadius: BorderRadius.circular(3),
            )
          : null,
      child: Text(
        productDetail,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
