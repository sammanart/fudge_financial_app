import 'package:fudge_financial_app/src/config/enums.dart';

class Transaction {
  String fullName;
  String country;
  String price;
  String date;
  TransactionStatus status;
  Transaction({
    required this.country,
    required this.date,
    required this.fullName,
    required this.price,
    required this.status,
  });
}
