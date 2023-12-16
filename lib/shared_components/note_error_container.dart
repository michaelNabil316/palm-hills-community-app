import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class ErrorContainer extends StatelessWidget {
  final String text;
  const ErrorContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red.withOpacity(0.08),
      padding: EdgeInsets.all(12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            color: AppColors.primary,
            size: 18.r,
          ),
          SizedBox(width: 5.h),
          Expanded(
            child: CustomText(
              text: text,
              size: 14.sp,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
