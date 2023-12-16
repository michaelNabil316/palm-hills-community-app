import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../../helper/navigation.dart';
import 'notifications_screen.dart';

class NotificationPermissionDialog extends StatelessWidget {
  const NotificationPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      content: Container(
          height: 324.h,
          width: 300.w,
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/notification_permission_icon.svg",
                height: 44.h,
              ),
              SizedBox(height: 16.h),
              CustomText(
                size: 20.sp,
                text: "Turn On Push Notifications",
                fontFamily: AppFontNames.gillSansBold,
              ),
              SizedBox(height: 16.h),
              CustomText(
                size: 16.sp,
                text:
                    "Stay updated with your reservations, as well as Palm Hills' "
                    "latest events and announcements!",
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomLargeButton(
                    onPressed: () {
                      Navigator.pop(context);
                      navigateTo(context, NotificationScreen());
                    },
                    text: "Turn On"),
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CustomText(
                  size: 16.sp,
                  text: "Maybe Later",
                  underline: true,
                  fontFamily: AppFontNames.gillSansBold,
                ),
              ),
            ],
          )),
    );
  }
}
