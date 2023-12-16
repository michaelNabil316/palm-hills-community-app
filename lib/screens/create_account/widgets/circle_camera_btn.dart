import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../helper/styles.dart';

class CircleCameraBtn extends StatelessWidget {
  final Function() onTap;
  const CircleCameraBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 36.r,
        backgroundColor: AppColors.primary,
        child: CircleAvatar(
          radius: 35.r,
          backgroundColor: Colors.white,
          child: SvgPicture.asset("assets/icons/camera_logo.svg"),
        ),
      ),
    );
  }
}
