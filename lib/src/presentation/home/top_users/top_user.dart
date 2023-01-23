import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/images.dart';

import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/presentation/home/top_users/bloc/top_users_bloc.dart';
import 'package:fudge_financial_app/src/presentation/home/top_users/widgets/avatar_info_skeleton.dart';

class TopUser extends StatelessWidget {
  TopUser({super.key});

  final _mockImages = [
    Images.avatar1,
    Images.avatar2,
    Images.avatar3,
    Images.avatar4,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(theme),
        verticalMargin(20),
        _buildUsersList(theme),
      ],
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Text(
      'Top USERS FROM YOUR COMMUNITY'.toUpperCase(),
      style: theme.textTheme.headline3!.copyWith(
        color: AppColors.black,
        fontSize: 12,
      ),
    );
  }

  Widget _buildUserAvatarInfo(
    ThemeData theme, {
    required String name,
    required String image,
  }) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: image.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          verticalMargin(13),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: theme.textTheme.headline5!.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsersList(ThemeData theme) {
    return BlocProvider(
      create: (context) => TopUsersBloc(
        userRepository: context.read(),
      )..add(
          GetTopUsersEvent(),
        ),
      child: BlocBuilder<TopUsersBloc, TopUsersState>(
        builder: (context, state) {
          if (state.executionState == ExecutionState.loading) {
            return const UserSkeleton();
          } else if (state.executionState == ExecutionState.ready) {
            return SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.users!.length,
                itemBuilder: ((context, index) {
                  return _buildUserAvatarInfo(
                    theme,
                    image: _mockImages[Random().nextInt(4)],
                    name: getName(state.users![index].username!),
                  );
                }),
              ),
            );
          }
          return nothing;
        },
      ),
    );
  }

  String getName(String? username) {
    var str = username!.split(RegExp(r'[^a-zA-Z0-9]'));
    if (str.length > 1) {
      return '${str.first}\n${str[1]}';
    }
    return str.first;
  }
}
