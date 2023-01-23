import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';

class CountInfo extends StatelessWidget {
  final int count;
  final String subtitle;
  const CountInfo({super.key, required this.count, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          '$count',
          style: theme.textTheme.headline3,
          textAlign: TextAlign.center,
        ),
        verticalMargin(5),
        Text(
          subtitle,
          style: theme.textTheme.headline5!.copyWith(
            color: AppColors.white.withOpacity(0.44),
          ),
        ),
      ],
    );
  }
}
