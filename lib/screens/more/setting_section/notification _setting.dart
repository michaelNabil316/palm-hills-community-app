import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../user_data.dart';
import 'controller/setting_controller.dart';
import 'widgets/setting_switcher.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "NOTIFICATION SETTING",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<SettingCtrl>(
            init: SettingCtrl(),
            builder: (con) {
              return Column(
                children: [
                  SizedBox(height: 45.h),
                  SettingSwitcherCard(
                    subTitle:
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr dolor sit.",
                    title: "Push Notifications",
                    IconPath: "assets/icons/notification_with_dot.svg",
                    switchValue: con.pushNotificationSwitcher,
                    onChanged: (value) {
                      con.changePushNotificationSwitcher(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  if (userGeneralData != null)
                    SettingSwitcherCard(
                      subTitle:
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr dolor sit.",
                      title: "Email Notifications",
                      IconPath: "assets/icons/message_dot.svg",
                      switchValue: con.emailNotificationSwitcher,
                      onChanged: (value) {
                        con.changeEmailNotificationSwitcher(value);
                      },
                    ),
                  SizedBox(height: 16.h),
                ],
              );
            }),
      ),
    );
  }
}
