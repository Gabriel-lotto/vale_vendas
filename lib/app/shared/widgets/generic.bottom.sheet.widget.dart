import 'package:flutter/material.dart';

import 'primary.button.widget.dart';

class GenericErrorBottomSheetWidget extends StatefulWidget {
  const GenericErrorBottomSheetWidget({
    super.key,
    this.title = "",
    this.message = "",
    this.rightButtonText,
    this.onRightButtonTap,
    this.onLeftButtonTap,
    this.leftButtonText = "",
  });

  final String? title;
  final String? message;
  final String? rightButtonText;
  final String? leftButtonText;
  final Function()? onRightButtonTap;
  final Function()? onLeftButtonTap;

  @override
  State<GenericErrorBottomSheetWidget> createState() => _GenericErrorBottomSheetWidgetState();
}

class _GenericErrorBottomSheetWidgetState extends State<GenericErrorBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(47, 146, 145, 1),
            Color.fromRGBO(111, 176, 174, 1),
          ],
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Text(
                widget.title ?? "",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                widget.message ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            widget.onLeftButtonTap != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PrimaryButtonWidget(
                        label: widget.leftButtonText ?? "",
                        onTap: widget.onLeftButtonTap,
                      ),
                      PrimaryButtonWidget(
                        label: widget.rightButtonText ?? "",
                        onTap: widget.onRightButtonTap,
                      ),
                    ],
                  )
                : PrimaryButtonWidget(
                    label: widget.rightButtonText ?? "",
                    onTap: widget.onRightButtonTap,
                  ),
          ],
        ),
      ),
    );
  }
}
