import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: 55,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.lightPurple,
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: theme.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
