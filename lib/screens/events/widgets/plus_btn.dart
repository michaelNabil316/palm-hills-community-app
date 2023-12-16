import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class PlusBtn extends StatelessWidget {
  final String text;
  final bool isActive;
  final Function() onTap;
  final double? padTop;
  const PlusBtn({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
    this.padTop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48.w,
        height: 48.w,
        padding: EdgeInsets.only(top: padTop ?? 8.h),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: CustomText(
          text: text,
          size: 30.sp,
          color: isActive ? AppColors.primary : Colors.grey,
        ),
      ),
    );
  }
}
