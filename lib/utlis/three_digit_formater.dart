import 'package:intl/intl.dart';

String threeDigitFormatter(double number) {
  NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");
  return numberFormat.format(number).toString();
}
