import 'package:fudge_financial_app/src/config/enums.dart';

class CreditCard {
  final String cardNumber;
  final String cardHolderName;
  final DateTime expiryDate;
  final CardType cardType;

  CreditCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
  });
}
