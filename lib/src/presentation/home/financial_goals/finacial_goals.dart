import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/presentation/widgets/progress_bar.dart';

class FinancialGoals extends StatelessWidget {
  FinancialGoals({super.key});
  final goals = [
    const ProgressIndicator(
      indicatorColor: AppColors.blue,
      progressPercent: 25,
      title: 'XX of total XX',
    ),
    const ProgressIndicator(
      indicatorColor: AppColors.red,
      progressPercent: 60,
      title: 'XX of total XX',
    ),
    const ProgressIndicator(
      indicatorColor: AppColors.teal,
      progressPercent: 50,
      title: 'XX of total XX',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(theme),
        ...List.generate(
          goals.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 33.0,
              ),
              child: goals[index],
            );
          },
        ),
      ],
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 44,
        bottom: 15,
      ),
      child: Text(
        'Financial Goals'.toUpperCase(),
        style: theme.textTheme.headline3!.copyWith(
          color: AppColors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}
