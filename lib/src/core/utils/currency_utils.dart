import 'package:intl/intl.dart';

String formatCurrency(double number) {
  var currencyFormat = NumberFormat("#.000", "en_US");

  if (number > 1000) {
    currencyFormat = NumberFormat("#,##0.00", "en_US");
    return currencyFormat.format(number);
  }

  return currencyFormat.format(number).replaceAll('.', ',');
}

List<int?> splitCardNumber(String str) {
  const splitSize = 4;
  RegExp exp = RegExp(r"\d{" "$splitSize" "}");
  Iterable<Match> matches = exp.allMatches(str);
  return matches.map((m) => int.tryParse(m.group(0)!)).toList();
}
