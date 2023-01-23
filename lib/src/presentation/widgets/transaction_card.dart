import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/images.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/data/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildAvatar(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFullName(theme),
                  verticalMargin(2),
                  _buildLocation(theme),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      _buildPrice(theme),
                    ],
                  ),
                  _buildDate(theme),
                ],
              ),
              _buildStatus()
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 13,
      ),
      child: Container(
        width: 39,
        height: 39,
        decoration: BoxDecoration(
          color: AppColors.blueCharcoal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Images.avatar,
          color: AppColors.white,
          size: 14,
        ),
      ),
    );
  }

  Widget _buildFullName(ThemeData theme) {
    return Text(
      transaction.fullName,
      style: theme.textTheme.headline4!.copyWith(
        color: AppColors.black,
      ),
    );
  }

  Widget _buildLocation(ThemeData theme) {
    return Text(
      transaction.country,
      style: theme.textTheme.headline5!.copyWith(
        color: AppColors.black.withOpacity(0.3),
      ),
    );
  }

  Widget _buildPrice(ThemeData theme) {
    return Text(
      transaction.price,
      style: theme.textTheme.headline4!.copyWith(
        color: AppColors.black,
      ),
    );
  }

  Widget _buildDate(ThemeData theme) {
    return Text(
      transaction.date,
      style: theme.textTheme.headline5!.copyWith(
        color: AppColors.black.withOpacity(0.3),
      ),
    );
  }

  Widget _buildStatus() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Image.asset(
        transaction.status == TransactionStatus.pending
            ? Images.pending
            : Images.check,
        width: 12,
      ),
    );
  }
}
