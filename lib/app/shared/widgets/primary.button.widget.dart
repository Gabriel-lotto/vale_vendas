import 'package:flutter/material.dart';
import 'package:vale_vendas/app/shared/utils/colors.default.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 108.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 40, left: 20, right: 20),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsDefault.primaryBlue,
            ),
            child: InkWell(
              onTap: onTap,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 32,
                  maxHeight: 48,
                ),
                child: Container(
                  height: 48.h,
                  width: 150.w,
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
