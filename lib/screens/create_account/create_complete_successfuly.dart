import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_icon.dart';
import '../home/main_page_bottom_nav.dart';
import '../login/login_screen.dart';

class CreateCompleteSuccessfuly extends StatelessWidget {
  const CreateCompleteSuccessfuly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithIcon(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            CustomText(
              text: "Your data has been successfully submitted",
              fontFamily: AppFontNames.gillSansBold,
              size: 20.sp,
            ),
            //
            SizedBox(height: 24.h),
            CustomText(
              text: "Our team is currently processing your data and",
              size: 16.sp,
            ),
            CustomText(
              text: "will get back to you within 24-48 hours.",
              size: 16.sp,
            ),
            SizedBox(height: 40.h),
            CustomText(
              text: "Until then...",
              size: 14.sp,
            ),
            SizedBox(height: 12.h),
            CustomLargeButton(
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 2));
                  navigateTo(context, MainPageBottomNav());
                },
                text: "Continue as a Guest"),
            SizedBox(height: 40.h),
            InkWell(
              onTap: () {
                navigateAndFinish(context, LoginScreen());
              },
              child: CustomText(
                text: "Back to Login",
                fontFamily: AppFontNames.gillSansBold,
                underline: true,
                size: 14.sp,
              ),
            ),
            const Spacer(),
            CustomText(
              text: "Once your account has been approved, you will receive a",
              size: 14.sp,
            ),
            CustomText(
              text: "confirmation message on +201065495113 so you can start",
              size: 14.sp,
            ),
            CustomText(
              text: "Using your account",
              size: 14.sp,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
