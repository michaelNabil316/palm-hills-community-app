import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line.dart';
import 'controller/controller.dart';
import 'widgets/no_notification_yet.dart';
import 'widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLine(
        title: "NOTIFICATIONS",
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: GetBuilder<NotificationCtrl>(
          init: NotificationCtrl(),
          builder: (con) {
            return SingleChildScrollView(
              child: con.notifications.isEmpty
                  ? NoNotificationWidget()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CustomText(
                            text: "New (2)",
                            size: 16.sp,
                            fontFamily: AppFontNames.gillSansBold,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        NotificationCard(
                          isNew: true,
                          date: "2m ago",
                          iconPath: "fork_knife.svg",
                          body: "You have a reservation for building "
                              "a better future event Today at 9:00pm!",
                          navigationTxt: "View Reservation",
                          navigationFun: () {},
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CustomText(
                            text: "Earlier",
                            size: 16.sp,
                            fontFamily: AppFontNames.gillSansBold,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        NotificationCard(
                          isNew: false,
                          date: "5h ago",
                          iconPath: "message.svg",
                          body: "Tala Ahmed wants to join the app "
                              "as your family member.",
                          navigationTxt: "Send Invitation code",
                          navigationFun: () {},
                        ),
                        SizedBox(height: 4.h),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                          indent: 20.w,
                          endIndent: 20.w,
                        ),
                        SizedBox(height: 4.h),
                        NotificationCard(
                          isNew: false,
                          date: "1d ago",
                          iconPath: "message.svg",
                          body: "hooray! New event is coming soon in Badya",
                          navigationTxt: "View Reservation",
                          navigationFun: () {},
                        ),
                      ],
                    ),
            );
          }),
    );
  }
}
