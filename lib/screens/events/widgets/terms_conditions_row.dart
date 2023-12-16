import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class TermsConditionsRow extends StatelessWidget {
  final bool isSelected;
  const TermsConditionsRow({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 25.w,
          height: 20.h,
          child: Center(
            child: isSelected
                ? SvgPicture.asset("assets/icons/rhmobus_filled_selected.svg")
                : Transform.rotate(
                    alignment: Alignment.center,
                    angle: pi / 4,
                    child: Icon(
                      Icons.square_outlined,
                      size: 18.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
          ),
        ),
        SizedBox(width: 5.w),
        CustomText(
          text: "Accept On ",
          size: 14.sp,
        ),
        CustomText(
          text: "TERMS &",
          size: 14.sp,
          fontFamily: AppFontNames.gillSansBold,
        ),
        CustomText(
          text: " CONDITIONS",
          size: 14.sp,
          color: AppColors.primary,
          fontFamily: AppFontNames.gillSansBold,
        ),
      ],
    );
  }
}
