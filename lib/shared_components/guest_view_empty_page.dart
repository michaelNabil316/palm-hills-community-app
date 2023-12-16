import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/screens/login/login_screen.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../helper/navigation.dart';
import '../screens/create_account/join_palm_hills_screen.dart';

class GuestViewEmptyPage extends StatelessWidget {
  final String subTitle;
  final String svgPath;
  const GuestViewEmptyPage({
    super.key,
    required this.subTitle,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 250.h),
        SvgPicture.asset(
          "assets/icons/$svgPath",
          color: AppColors.secondaryText,
          height: 60.h,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: "Only Available for Registered Users",
          isBold: true,
          size: 18.sp,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: "$subTitle",
        ),
        SizedBox(height: 40.h),
        CustomLargeButton(
            onPressed: () {
              navigateTo(context, JoinPalmHillsScreen());
            },
            text: "Create Account"),
        SizedBox(height: 32.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "ALready Have an account?",
              size: 16.sp,
            ),
            SizedBox(width: 2.w),
            GestureDetector(
              onTap: () {
                navigateTo(context, LoginScreen());
              },
              child: CustomText(
                text: "Login",
                isBold: true,
                size: 16.sp,
                underline: true,
                bolUnderline: true,
              ),
            ),
          ],
        )
      ],
    );
  }
}
