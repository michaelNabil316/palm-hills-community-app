import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';

class ReservedForAccounts extends StatelessWidget {
  final String text;
  const ReservedForAccounts({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromRGBO(34, 187, 51, 0.07),
      padding: EdgeInsets.all(12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 18.r,
            color: Color.fromRGBO(34, 187, 51, 1),
          ),
          SizedBox(width: 5.h),
          CustomText(
            text: "Reserved for ",
            size: 14.sp,
          ),
          CustomText(
            text: text,
            size: 14.sp,
            isBold: true,
          ),
          Expanded(
            child: CustomText(
              text: " people",
              size: 14.sp,
              textAlign: TextAlign.start,
              isBold: true,
            ),
          ),
        ],
      ),
    );
  }
}
