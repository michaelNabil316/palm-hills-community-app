import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String imgPath;
  const CustomRadioButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: isSelected ? AppColors.secondaryText : Colors.grey.shade300),
      ),
      child: Row(
        children: [
          SvgPicture.asset(imgPath),
          SizedBox(width: 20.w),
          CustomText(
            text: title,
            fontFamily: isSelected
                ? AppFontNames.gillSansBold
                : AppFontNames.gillSansMedium,
            size: 14.sp,
          ),
        ],
      ),
    );
  }
}
