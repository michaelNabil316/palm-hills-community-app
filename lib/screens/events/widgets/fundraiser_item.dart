import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class FundraiserItem extends StatelessWidget {
  final String title;
  const FundraiserItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 7.w),
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20)),
      child: CustomText(
        text: title,
        size: 14.sp,
        color: AppColors.primary,
      ),
    );
  }
}
