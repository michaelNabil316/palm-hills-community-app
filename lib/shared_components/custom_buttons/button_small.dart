import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/helper/styles.dart';
import '../custom_text.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool? noIcon;

  const CustomSmallButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.noIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 138.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.r),
          border: Border.all(color: AppColors.primary, width: 1.sp),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: text,
                color: AppColors.primary,
                fontFamily: AppFontNames.gillSansBold,
                size: 14.sp,
              ),
              if (noIcon != true) SizedBox(width: 4.w),
              if (noIcon != true)
                SvgPicture.asset("assets/icons/double_arraw_right.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
