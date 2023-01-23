import 'package:flutter/material.dart';

Widget verticalMargin([double size = 8]) {
  return SizedBox(
    height: size,
  );
}

Widget horizontalMargin([double size = 8]) {
  return SizedBox(
    width: size,
  );
}

Widget nothing = const SizedBox.shrink();

getHeight(BuildContext context, {double? percentage}) {
  if (percentage == null) return MediaQuery.of(context).size.height;
  return (MediaQuery.of(context).size.height * percentage) / 100;
}

getWidth(BuildContext context, {double? percentage}) {
  if (percentage == null) return MediaQuery.of(context).size.width;
  return (MediaQuery.of(context).size.width * percentage) / 100;
}
