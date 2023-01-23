import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/core/utils/currency_utils.dart';
import 'package:fudge_financial_app/src/presentation/home/widgets/count_info.dart';
import 'package:fudge_financial_app/src/presentation/home/widgets/user_info_row.dart';

class Balance extends StatelessWidget {
  final double balance;
  final double lastTransactionPrice;
  final double percent;
  final double followingCount;
  final double transactionCount;
  final double billCount;

  const Balance({
    super.key,
    required this.balance,
    required this.lastTransactionPrice,
    required this.percent,
    required this.followingCount,
    required this.transactionCount,
    required this.billCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _buildMainContent(theme);
  }

  Widget _buildMainContent(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 56),
      child: Column(
        children: [
          const UserInfoRow(
            userName: ', Michael',
          ),
          verticalMargin(36),
          _buildCurrentBalance(theme),
          verticalMargin(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLastAddedBalance(theme),
              horizontalMargin(18),
              _growPercent(theme),
            ],
          ),
          verticalMargin(10),
          Text(
            'account balance'.toUpperCase(),
            style: theme.textTheme.headline5!.copyWith(
              color: AppColors.fontGrey,
            ),
          ),
          verticalMargin(40),
          _buildBillManager()
        ],
      ),
    );
  }

  Widget _buildCurrentBalance(ThemeData theme) {
    return Text(
      '\$${formatCurrency(balance)}',
      style: theme.textTheme.headline1,
    );
  }

  Widget _buildLastAddedBalance(ThemeData theme) {
    return Text(
      '+\$${formatCurrency(lastTransactionPrice)}',
      style: theme.textTheme.headline2!.copyWith(
        fontSize: 15,
      ),
    );
  }

  Widget _growPercent(ThemeData theme) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_upward,
          color: AppColors.green,
          size: 17,
        ),
        horizontalMargin(4),
        Text(
          '$percent%',
          style: theme.textTheme.headline2!.copyWith(
            fontSize: 15,
            color: AppColors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildBillManager() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        horizontalMargin(30),
        const CountInfo(
          count: 12,
          subtitle: 'Following',
        ),
        _buildDivider(),
        const CountInfo(
          count: 36,
          subtitle: 'Transactions',
        ),
        _buildDivider(),
        const CountInfo(
          count: 4,
          subtitle: 'Bills',
        ),
        horizontalMargin(30),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 40,
      color: AppColors.white,
    );
  }
}
