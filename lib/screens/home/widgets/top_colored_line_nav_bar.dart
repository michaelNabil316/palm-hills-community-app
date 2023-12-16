import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/styles.dart';

class TopColoredLineInNavBar extends StatelessWidget {
  const TopColoredLineInNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      color: AppColors.primary,
      height: 2,
      width: 55.w,
      child: SizedBox(),
    );
  }
}
