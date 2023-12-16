import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_icon.dart';

class AdditionRequestCompleteSuccessfuly extends StatelessWidget {
  const AdditionRequestCompleteSuccessfuly({super.key});

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
              text: "Your addition request has been successfully submitted",
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
                onPressed: () => Navigator.pop(context),
                text: "Back to Hills Today"),
          ],
        ),
      ),
    );
  }
}
