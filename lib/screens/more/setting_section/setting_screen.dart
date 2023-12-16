import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../home/main_page_bottom_nav.dart';
import '../../home/sections/custom_bottom_nav.dart';
import '../../home/sections/floating_action_button.dart';
import '../profile_section/profile_screen.dart';
import 'language_setting_screen.dart';
import 'notification _setting.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_of_use/terms_of_use.dart';
import 'widgets/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "PROFILE & ACCOUNT",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButoonCustomization(),
      bottomNavigationBar: CustomBottomNav(
        onTapFromSubScreen: () {
          navigateAndFinish(context, MainPageBottomNav());
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 45.h),
            SettingItem(
              text: "Notification Settings",
              imgName: "notification",
              svgHeight: 22.h,
              onTap: () {
                navigateTo(context, NotificationSettingScreen());
              },
            ),
            SizedBox(height: 16.h),
            SettingItem(
              text: "App Language",
              imgName: "language_icon",
              onTap: () {
                navigateTo(context, LanguageSettingScreen());
              },
            ),
            if (userGeneralData != null) SizedBox(height: 16.h),
            if (userGeneralData != null)
              SettingItem(
                  text: "Manage Account",
                  imgName: "setting",
                  svgHeight: 22.h,
                  onTap: () {
                    navigateTo(context, ProfileScreen());
                  }
                  // () {
                  //   navigateTo(context, ManageAccountSettingScreen());
                  // },
                  ),
            SizedBox(height: 16.h),
            SettingItem(
              text: "Privacy Policy",
              imgName: "document_icon",
              onTap: () {
                navigateTo(context, PrivacyPolicyScreen());
              },
            ),
            SizedBox(height: 16.h),
            SettingItem(
              text: "Terms of Use",
              imgName: "file",
              svgHeight: 20.h,
              onTap: () {
                navigateTo(context, TermsOfUseScreen());
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
