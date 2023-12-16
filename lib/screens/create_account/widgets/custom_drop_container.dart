import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import 'dart:math' as math;

class CustomDropContainer extends StatelessWidget {
  final String text;
  final bool isValueChanged;
  const CustomDropContainer({
    super.key,
    required this.text,
    required this.isValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: AppColors.secondaryText.withOpacity(0.3))),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          CustomText(
            text: text,
            color: isValueChanged ? AppColors.secondaryText : Colors.grey,
          ),
          Spacer(),
          Transform.rotate(
            alignment: Alignment.center,
            angle: math.pi * 3 / 2,
            child: SvgPicture.asset(
              "assets/icons/arrow_back.svg",
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
