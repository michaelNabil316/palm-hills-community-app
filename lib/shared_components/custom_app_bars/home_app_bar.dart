import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../screens/notifications/notification_permission_dialog.dart';
import '../../screens/notifications/widgets/notification_icon.dart';
import '../../screens/switch_community/bottom_sheet_switch_commuinty.dart';
import '../../screens/switch_community/widgets/title_home_app_bar.dart';
import '../../helper/styles.dart';

AppBar homeAppBar({
  required context,
  bool? noBackArrow,
  Function()? onPressBackBtn,
  Function()? onPressNotification,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: 95.h,
    leading: const SizedBox(),
    forceMaterialTransparency: true,
    flexibleSpace: Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: Size(1.sw, 70.h),
          painter: CustomShapePainter(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //    SizedBox(height: 20.h),
              noBackArrow == true
                  ? SizedBox(width: 70.w)
                  : InkWell(
                      onTap: onPressBackBtn,
                      child: SizedBox(
                        width: 65.w,
                        child: SvgPicture.asset(
                          "assets/icons/arrow_back.svg",
                          height: 22.h,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
              //   SizedBox(width: 80.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  CustomText(
                    text: "Currently Viewing",
                    color: Colors.white,
                    size: 14.sp,
                  ),
                  SizedBox(height: 4.h),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SwitchCommunityBottomSheet();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        SwitchTitleName(),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/icons/small_bottom_arrow.svg")
                      ],
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: onPressNotification ??
                    () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationPermissionDialog();
                        },
                      );
                    },
                child: Container(
                  padding: EdgeInsets.only(right: 10.w),
                  margin: EdgeInsets.only(top: 50.h),
                  child: NotificationIcon(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 23.w,
          top: Platform.isIOS
              ? 116.h
              : bigAndroidScreen()
                  ? 83.h
                  : 95.h,
          child: SvgPicture.asset(
            "assets/icons/palm_hills_logo.svg",
            height: 75.h,
            fit: BoxFit.fitHeight,
          ),
        )
      ],
    ),
  );
}

bool bigAndroidScreen() {
  if (1.sh > 840) {
    return true;
  }
  return false;
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryText
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(bigAndroidScreen() ? size.width * 0.255 : size.width * 0.269,
          size.height) //right point
      ..lineTo(bigAndroidScreen() ? size.width * 0.145 : size.width * 0.15,
          size.height * 0.63) //top point
      ..lineTo(size.width * 0.035, size.height) // left point
      ..close();
    final pathIos = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.27, size.height) //right point
      ..lineTo(size.width * 0.151, size.height * 0.7) //top of circle
      ..lineTo(size.width * 0.035, size.height)
      ..close();

    canvas.drawPath(Platform.isAndroid ? path : pathIos, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
