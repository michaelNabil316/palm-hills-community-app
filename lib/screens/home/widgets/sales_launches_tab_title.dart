import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class TabTitle extends StatelessWidget {
  final bool isSelected;
  final String title;
  const TabTitle({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSelected ? 1.w : 10.w),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: isSelected ? AppColors.secondaryText : Colors.black12,
          width: 1.0,
        )),
      ),
      child: isSelected
          ? CustomText(
              text: title,
              fontFamily: AppFontNames.gillSansBold,
              color: AppColors.secondaryText,
              size: 16.sp,
            )
          : CustomText(
              text: title,
              color: AppColors.primaryText,
              size: 16.sp,
            ),
    );
  }
}
