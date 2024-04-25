import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vale_vendas/app/shared/models/product.dart';
import 'package:vale_vendas/app/shared/utils/colors.default.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';
import 'package:vale_vendas/app/shared/widgets/switch.widget.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final String percentual;
  final bool switchValue;
  final void Function()? onTapButton;

  const ProductWidget({
    super.key,
    required this.product,
    required this.percentual,
    required this.switchValue,
    this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 242.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: .5,
          color: ColorsDefault.borderColorPrimary,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: .3,
                                  color: ColorsDefault.borderColorPrimary,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: product.image,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.red[300]!,
                                  highlightColor: Colors.red[100]!,
                                  child: SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                            Container(width: 17.w),
                            SizedBox(
                              width: 143.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    product.title,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsDefault.secondaryTextBlack,
                                    ),
                                  ),
                                  Container(height: 4.h),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Desconto: ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ColorsDefault.primaryGrey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: percentual,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ColorsDefault.primaryGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 12.h),
                    ],
                  ),
                  SizedBox(
                    width: 270.w,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data ativação',
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorsDefault.primaryGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(height: 4.h),
                            Text(
                              '30/12/2023 - 10:25',
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorsDefault.primaryGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(width: 30.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Data ativação',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsDefault.primaryGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(height: 4.h),
                              Text(
                                '30/12/2023 - 10:25',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsDefault.primaryGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SwitchWidget(
                  switchValue: switchValue,
                  onChanged: (a) {
                    a = switchValue;
                  },
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: onTapButton,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: ColorsDefault.borderColorPrimary,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ver Desconto",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsDefault.primaryGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(width: 4.w),
                  SvgPicture.asset(
                    'assets/svg/eye.svg',
                    colorFilter: ColorFilter.mode(
                      ColorsDefault.primaryGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
