import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/shared_components/two_colored_titles.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_app_bars/app_bar_icon.dart';
import '../../home/main_page_bottom_nav.dart';

class TenantAddedSuccessfuly extends StatelessWidget {
  const TenantAddedSuccessfuly({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigateAndFinish(context, MainPageBottomNav());
        return false;
      },
      child: Scaffold(
        appBar: appBarWithIcon(
          withBack: true,
          onTapBackBtn: () => navigateAndFinish(context, MainPageBottomNav()),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              CustomText(
                text:
                    "Your data for adding a tenant has been successfully submitted",
                fontFamily: AppFontNames.gillSansBold,
                size: 20.sp,
              ),
              //
              SizedBox(height: 24.h),
              CustomText(
                text: "Our team is currently processing your submitted data.",
                size: 16.sp,
              ),
              SizedBox(height: 40.h),
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
                      text:
                          "Kindly visit our community office with the tenant within 48-72 hours to complete the process.",
                      size: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
