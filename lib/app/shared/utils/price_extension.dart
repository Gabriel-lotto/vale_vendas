import 'package:intl/intl.dart';

extension PriceExtension on num {
  String toCurrency() {
    final numberFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return numberFormat.format(this);
  }
}
