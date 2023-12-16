import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../home/main_page_bottom_nav.dart';

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 180.h),
          SvgPicture.asset(
            "assets/icons/notification_permission_icon.svg",
            color: AppColors.secondaryText,
            height: 40.h,
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: "Only Available for Registered Users",
            isBold: true,
            size: 18.sp,
          ),
          SizedBox(height: 16.h),
          CustomText(
            text:
                "Come back later. You will be notified once updates are available.",
          ),
          SizedBox(height: 40.h),
          CustomLargeButton(
              onPressed: () {
                navigateAndFinish(context, MainPageBottomNav());
              },
              text: "Go back to home"),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
