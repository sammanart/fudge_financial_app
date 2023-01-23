import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/router.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/data/models/transaction.dart';
import 'package:fudge_financial_app/src/presentation/home/balance/balance.dart';
import 'package:fudge_financial_app/src/presentation/home/financial_goals/finacial_goals.dart';
import 'package:fudge_financial_app/src/presentation/home/performance_chart/performance_chart.dart';
import 'package:fudge_financial_app/src/presentation/home/recent_transaction_list/recent_transaction_list.dart';
import 'package:fudge_financial_app/src/presentation/home/top_users/top_user.dart';
import 'package:fudge_financial_app/src/presentation/widgets/custom_text_button.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final _mockTransaction = [
    Transaction(
      fullName: 'JOHN DOE',
      country: 'United Kingdom',
      price: '80,000',
      date: '11 Aug 2021',
      status: TransactionStatus.pending,
    ),
    Transaction(
      fullName: 'JOHN DOE',
      country: 'United Kingdom',
      price: '80,000',
      date: '11 Aug 2021',
      status: TransactionStatus.success,
    ),
    Transaction(
      fullName: 'JOHN DOE',
      country: 'United Kingdom',
      price: '80,000',
      date: '11 Aug 2021',
      status: TransactionStatus.success,
    ),
    Transaction(
      fullName: 'JOHN DOE',
      country: 'United Kingdom',
      price: '80,000',
      date: '11 Aug 2021',
      status: TransactionStatus.success,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildMainContent(context);
  }

  Widget _buildMainContent(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Column(
        children: [
          _buildBalanceContent(context),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 23,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PerformanceChart(),
                  TopUser(),
                  _buildRecentTransactions(context),
                  FinancialGoals(),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildBalanceContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      width: getWidth(context),
      decoration: const BoxDecoration(
        color: AppColors.blueCharcoal,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: const Balance(
        balance: 56271.68,
        lastTransactionPrice: 9.736,
        percent: 2.3,
        followingCount: 12,
        transactionCount: 36,
        billCount: 4,
      ),
    );
  }

  Widget _buildRecentTransactions(
    BuildContext context,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _label(Theme.of(context), 'Recent Transactions'.toUpperCase()),
            CustomTextButton(
              text: 'more',
              onPressed: () {
                Navigator.pushNamed(context, Routes.savedCards);
              },
            )
          ],
        ),
        RecentTransactionList(
          transactions: _mockTransaction,
        ),
      ],
    );
  }

  Widget _label(
    ThemeData theme,
    String text,
  ) {
    return Text(
      text,
      style: theme.textTheme.headline3!.copyWith(
        color: AppColors.black,
        fontSize: 12,
      ),
    );
  }
}
