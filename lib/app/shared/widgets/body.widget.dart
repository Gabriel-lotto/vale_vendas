import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vale_vendas/app/shared/utils/colors.default.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';

class BodyWidget extends StatelessWidget {
  final Widget? child;
  final String pageTitle;
  final bool showAppBar;
  final bool showBackButton;
  final Widget? bottomSheet;
  const BodyWidget({
    super.key,
    this.child,
    required this.pageTitle,
    this.showAppBar = true,
    this.showBackButton = true,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet,
      backgroundColor: Colors.white,
      appBar: child != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(101.0),
              child: AppBar(
                backgroundColor: Colors.white,
                forceMaterialTransparency: true,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorsDefault.secondaryBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                toolbarHeight: 101,
                automaticallyImplyLeading: false,
                actions: [
                  showAppBar
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.only(top: 49, bottom: 19),
                          child: Row(
                            mainAxisAlignment:
                                showBackButton ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: showBackButton,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Modular.to.pop();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/svg/arrow_back.svg',
                                      colorFilter: ColorFilter.mode(
                                        ColorsDefault.primaryBlue,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                pageTitle,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsDefault.primaryTextBlack,
                                ),
                              ),
                              Visibility(
                                visible: showBackButton,
                                child: Container(width: 50),
                              )
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          : null,
      body: Center(
        child: child ??
            SvgPicture.asset(
              'assets/svg/splash_logo.svg',
              alignment: Alignment.center,
              width: 150.w,
              height: 150.h,
            ),
      ),
    );
  }
}
