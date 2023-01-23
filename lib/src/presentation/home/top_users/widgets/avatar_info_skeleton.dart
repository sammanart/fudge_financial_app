import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:skeletons/skeletons.dart';

class UserSkeleton extends StatelessWidget {
  const UserSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: getWidth(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    shape: BoxShape.circle,
                    width: 50,
                    height: 50,
                  ),
                ),
                verticalMargin(10),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 10,
                    width: 64,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
