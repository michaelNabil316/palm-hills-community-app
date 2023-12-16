import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../helper/styles.dart';

class CircleBinBtn extends StatelessWidget {
  final Function()? onTap;
  final double? radius;
  const CircleBinBtn({super.key, this.onTap, this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        radius: radius ?? 20.r,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius != null ? (radius! - 1.r) : 19.r,
          child: SvgPicture.asset("assets/icons/bin_icon.svg"),
        ),
      ),
    );
  }
}
