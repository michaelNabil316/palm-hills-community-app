import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class TermsItem extends StatelessWidget {
  final String text;
  final Color? color;
  const TermsItem({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 25.w,
          padding: EdgeInsets.only(top: 4.h),
          child: Transform.rotate(
            alignment: Alignment.center,
            angle: 15,
            child: Icon(
              Icons.square,
              size: 8.sp,
              color: color ?? AppColors.secondaryText,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomText(
            textAlign: TextAlign.start,
            text: text,
            size: 14.sp,
            color: color ?? AppColors.secondaryText,
          ),
        )
      ],
    );
  }
}
