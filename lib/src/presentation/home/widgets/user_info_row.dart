import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/images.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';

class UserInfoRow extends StatelessWidget {
  final String userName;
  const UserInfoRow({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 23,
        right: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(theme),
          Row(
            children: [
              _buildBellIcon(),
              horizontalMargin(22),
              _buildUserImage(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Hola',
            style: theme.textTheme.headline2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: userName,
                style: theme.textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        verticalMargin(4),
        Text(
          'Te tenemos excelentes noticias para ti',
          style: theme.textTheme.headline6,
        )
      ],
    );
  }

  Widget _buildBellIcon() {
    return const Icon(
      Images.bell,
      size: 18,
      color: AppColors.white,
    );
  }

  Widget _buildUserImage() {
    return Image.asset(
      Images.userImage,
      width: 18,
    );
  }
}
