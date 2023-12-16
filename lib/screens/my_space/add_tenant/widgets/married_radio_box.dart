import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';

class MarriedRadioBox extends StatelessWidget {
  final String text;
  final bool isSelected;
  const MarriedRadioBox({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w),
          isSelected
              ? SvgPicture.asset("assets/icons/rhmobus_filled_selected.svg")
              : Transform.rotate(
                  alignment: Alignment.center,
                  angle: pi / 4,
                  child: Icon(
                    Icons.square_outlined,
                    size: 19.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
          SizedBox(width: 10.w),
          CustomText(
            text: text,
            color: isSelected ? AppColors.secondaryText : Colors.grey,
          ),
        ],
      ),
    );
  }
}
