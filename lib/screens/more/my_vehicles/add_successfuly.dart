import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/shared_components/two_colored_titles.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../shared_components/custom_app_bars/app_bar_icon.dart';

class AddVehicleSuccessful extends StatelessWidget {
  final bool? isEditCase;
  const AddVehicleSuccessful({super.key, this.isEditCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithIcon(
        withBack: true,
        onTapBackBtn: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            CustomText(
              text:
                  "Your request for ${isEditCase == true ? "editing" : "adding"} a vehicle has been successfully submitted",
              fontFamily: AppFontNames.gillSansBold,
              size: 20.sp,
            ),
            SizedBox(height: 24.h),
            if (isEditCase != true)
              CustomText(
                text: "You will receive a notification within 48"
                    " hours once your vehicle data has been approved.",
                size: 16.sp,
              ),
            SizedBox(height: 40.h),
            if (isEditCase != true)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.w),
                  TwoColoredTexts(txt1: "UPCOMING", txt2: "STEP"),
                ],
              ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomText(
                    textAlign: TextAlign.start,
                    text: isEditCase == true
                        ? "Our team is currently processing the uploaded information and we will get back to you within 24-48 h"
                        : "Once approved, you can visit the nearest community office to collect your car sticker.",
                    size: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
