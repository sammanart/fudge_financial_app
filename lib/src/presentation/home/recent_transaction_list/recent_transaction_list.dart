import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/data/models/transaction.dart';
import 'package:fudge_financial_app/src/presentation/widgets/transaction_card.dart';

class RecentTransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const RecentTransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        transactions.length,
        (index) => TransactionCard(
          transaction: transactions[index],
        ),
      ),
    );
  }
}
