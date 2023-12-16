import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';

class BottomHint extends StatelessWidget {
  final String text;
  const BottomHint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/icons/hint_lamp.svg"),
        SizedBox(width: 5.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: CustomText(
              text: text,
              textAlign: TextAlign.start,
              size: 12,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
