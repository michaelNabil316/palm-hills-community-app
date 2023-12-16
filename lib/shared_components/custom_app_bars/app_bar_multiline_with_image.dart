import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../helper/constants.dart';
import '../../screens/notifications/notification_permission_dialog.dart';
import '../../screens/notifications/widgets/notification_icon.dart';
import '../../helper/styles.dart';

AppBar multilineWithImageAppBar({
  required context,
  Function()? onPressNotification,
  Function()? onTapProfileImg,
  required String? title,
  String? owner,
}) {
  return AppBar(
    backgroundColor: AppColors.secondaryText,
    toolbarHeight: 95.h,
    leading: const SizedBox(),
    flexibleSpace: LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 70.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  SizedBox(
                    width: 200.w,
                    child: CustomText(
                      text: title ?? "Guest",
                      color: Colors.white,
                      size: 22.sp,
                      fontFamily: AppFontNames.gillSansBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    text: owner ?? "Currently Viewing",
                    color: Colors.white,
                    size: 14.sp,
                  ),
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
          Positioned(
            left: 22.w,
            // top: Platform.isIOS
            //     ? 116.h
            //     : bigAndroidScreen()
            //         ? 83.h
            //         : 90.h,
            top: Platform.isIOS
                ? constraints.maxHeight * 0.76
                : bigAndroidScreen()
                    ? constraints.maxHeight * 0.68
                    : constraints.maxHeight * 0.71,
            child: InkWell(
              onTap: onTapProfileImg,
              child: RhombusImage(
                imagePath: null,
                rhombusSize: 75.h,
              ),
            ),
          ),
        ],
      );
    }),
  );
}

bool bigAndroidScreen() {
  if (1.sh > 840) {
    return true;
  }
  return false;
}

class RhombusImage extends StatelessWidget {
  final String? imagePath;
  final double rhombusSize;

  RhombusImage({required this.imagePath, required this.rhombusSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: rhombusSize,
      height: rhombusSize,
      child: ClipPath(
        clipper: RhombusClipper(),
        child: Image.network(
          imagePath ?? defaultProfileUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class RhombusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
