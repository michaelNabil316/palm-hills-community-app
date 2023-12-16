import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final double? marginVertical;
  final double? marginHorizontal;
  final Color? color;
  const CustomVerticalDivider({
    super.key,
    this.height,
    this.width,
    this.marginHorizontal,
    this.marginVertical,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? 0, vertical: marginVertical ?? 0),
      height: height,
      color: color ?? Colors.grey,
      width: width ?? 2,
      child: SizedBox(),
    );
  }
}
