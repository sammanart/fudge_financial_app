import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';

class ProgressIndicator extends StatelessWidget {
  final String title;
  final double progressPercent;
  final Color indicatorColor;
  const ProgressIndicator({
    super.key,
    required this.title,
    required this.progressPercent,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headline4!.copyWith(
            color: AppColors.fontGrey,
          ),
        ),
        verticalMargin(6),
        Stack(
          children: [
            Container(
              width: getWidth(context),
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.indicatorGrey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: getWidth(context, percentage: progressPercent),
              height: 4,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
