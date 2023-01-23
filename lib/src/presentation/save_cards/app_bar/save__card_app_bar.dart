import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/images.dart';
import 'package:fudge_financial_app/src/config/theme.dart';

class SaveCardAppBar extends StatelessWidget {
  const SaveCardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Images.back,
          size: 13,
          color: AppColors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'My save cards',
        style: theme.textTheme.headline2!.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleSpacing: 0,
      centerTitle: false,
      actions: const [
        
        Padding(
          padding: EdgeInsets.only(right: 23),
          child: Icon(
            Images.menu,
            color: AppColors.black,
            size: 12,
          ),
        )
      ],
    );
  }
}
