import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/styles.dart';
import 'custom_text.dart';

class TwoColoredTexts extends StatelessWidget {
  final String txt1;
  final String txt2;
  const TwoColoredTexts({
    super.key,
    required this.txt1,
    required this.txt2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: txt1,
          color: AppColors.secondaryText,
          size: 18.sp,
          fontFamily: AppFontNames.gillSansBold,
        ),
        SizedBox(width: 5.w),
        CustomText(
          text: txt2,
          color: AppColors.primary,
          size: 18.sp,
          fontFamily: AppFontNames.gillSansBold,
        ),
      ],
    );
  }
}
