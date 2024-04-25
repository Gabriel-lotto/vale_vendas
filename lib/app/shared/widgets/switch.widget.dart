import 'package:flutter/material.dart';
import 'package:vale_vendas/app/shared/utils/colors.default.dart';

class SwitchWidget extends StatelessWidget {
  final void Function(bool)? onChanged;
  final bool switchValue;
  const SwitchWidget({super.key, this.onChanged, required this.switchValue});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Switch.adaptive(
        value: switchValue,
        onChanged: onChanged,
        activeColor: ColorsDefault.switchSecondaryBlue,
        activeTrackColor: ColorsDefault.switchSecondaryBlue.withOpacity(.4),
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.grey.withOpacity(.4),
      ),
    );
  }
}
