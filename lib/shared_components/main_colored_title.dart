import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/styles.dart';
import 'custom_text.dart';

class MainTitleColored extends StatelessWidget {
  final String title1;
  final String title2;
  const MainTitleColored({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title1 + " ",
          size: 18.sp,
          fontFamily: AppFontNames.gillSansBold,
        ),
        CustomText(
          text: title2,
          color: AppColors.primary,
          size: 18.sp,
          fontFamily: AppFontNames.gillSansBold,
        ),
      ],
    );
  }
}
