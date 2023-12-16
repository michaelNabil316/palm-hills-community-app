import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class NoAnnouncements extends StatelessWidget {
  const NoAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 250.h),
        SvgPicture.asset(
          "assets/icons/un_community.svg",
          width: 40.w,
          height: 40.w,
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "No Announcements Yet!",
              size: 20.sp,
              fontFamily: AppFontNames.gillSansBold,
            ),
          ],
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
