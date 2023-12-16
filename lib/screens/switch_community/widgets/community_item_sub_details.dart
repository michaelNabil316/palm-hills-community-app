import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';

class CommunityItemSubDetails extends StatelessWidget {
  final String owner;
  final int units;
  const CommunityItemSubDetails(
      {super.key, required this.owner, required this.units});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/person_logo.svg"),
            SizedBox(width: 5.w),
            SizedBox(
              height: 30.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    CustomText(text: owner, size: 14.sp),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/home_outlite.svg"),
            SizedBox(width: 10.w),
            SizedBox(
              height: 30.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    CustomText(text: "$units Unit", size: 14.sp),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
