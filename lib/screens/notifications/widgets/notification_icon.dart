import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../controller/controller.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  final con = Get.put(NotificationCtrl(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationCtrl>(
      builder: (_) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset("assets/icons/notification.png"),
            if (con.notifications.isNotEmpty)
              Positioned(
                top: -10,
                right: -10,
                child: CircleAvatar(
                  radius: 11.r,
                  backgroundColor: AppColors.primary,
                  child: CustomText(
                    text: "${con.notifications.length}",
                    color: Colors.white,
                    size: 12.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
