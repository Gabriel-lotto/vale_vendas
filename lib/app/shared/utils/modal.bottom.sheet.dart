import 'package:flutter/material.dart';
import 'package:vale_vendas/app.config.dart';

import '../widgets/generic.bottom.sheet.widget.dart';

class ModalBottomSheets {
  static Future<void> showConnectionErrorBottomSheet() async {
    final context = AppConfig.instance.navigatorKey.currentState!.context;
    await showModalBottomSheet(
      context: context,
      builder: (_) => GenericErrorBottomSheetWidget(
        title: 'Erro de conexão',
        message: 'Conexão falha com a internet. Por favor, verifique suas configurações de rede.',
        rightButtonText: 'Ok, entendi',
        onRightButtonTap: () => Navigator.of(context).pop(),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }

  static Future<void> showUnexpectedErrorBottomSheet({String? message}) async {
    final context = AppConfig.instance.navigatorKey.currentState!.context;
    await showModalBottomSheet(
      context: context,
      builder: (_) => GenericErrorBottomSheetWidget(
        title: 'Erro!',
        message: message ?? 'Estamos enfrentando alguns problemas técnicos.\nPor favor tente novamente mais tarde.',
        rightButtonText: 'Ok, entendi',
        onRightButtonTap: () => Navigator.of(context).pop(),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }

  static Future<void> showGenericBottomSheet({
    String? message,
    String? title,
    String? leftButtonText,
    String? rightButtonText,
    Function()? leftButtonTap,
    Function()? rightButtonTap,
  }) async {
    final context = AppConfig.instance.navigatorKey.currentState!.context;
    await showModalBottomSheet(
      context: context,
      builder: (_) => GenericErrorBottomSheetWidget(
        title: title,
        message: message,
        leftButtonText: leftButtonText,
        rightButtonText: rightButtonText,
        onLeftButtonTap: leftButtonTap,
        onRightButtonTap: rightButtonTap,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }
}
