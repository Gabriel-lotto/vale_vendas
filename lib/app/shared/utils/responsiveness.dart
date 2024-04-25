import 'package:flutter/material.dart';
import 'package:vale_vendas/app.config.dart';

// enum para definir os breakpoints do tamanho do dispositivo
enum DesignBreakPoints {
  height(844),
  width(390);

  const DesignBreakPoints(this.value);
  final double value;
}

// classe que define a responsividade do app
class Responsiveness {
  static final _context = AppConfig.instance.navigatorKey.currentContext!;
  static final _view = View.of(_context);

  static double get width => MediaQueryData.fromView(_view).size.width;

  static double get height => MediaQueryData.fromView(_view).size.height;

  static double get heightScale => height / DesignBreakPoints.height.value;

  static double get widthScale => width / DesignBreakPoints.width.value;

  static double scaledHeight(double height) => height * heightScale;

  static double scaledWidth(double width) => width * widthScale;
}

// extensão para facilitar o uso dda classe Responsiveness
extension DimensionsScreenExtension on num {
  double get h => Responsiveness.scaledHeight(toDouble());
  double get w => Responsiveness.scaledWidth(toDouble());
}
