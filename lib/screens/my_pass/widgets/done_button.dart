import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class DoneButton extends StatelessWidget {
  const DoneButton(
      {super.key, required this.fun, required this.icon, required this.text});

  final String text;
  final VoidCallback fun;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        height: 58.h,
        // width: 342.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.5.r),
          border: Border.all(
            color: AppColors.success,
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: AppColors.success,
              ),
              SizedBox(width: 4.w),
              CustomText(
                text: text,
                color: AppColors.success,
                fontFamily: AppFontNames.gillSansBold,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
