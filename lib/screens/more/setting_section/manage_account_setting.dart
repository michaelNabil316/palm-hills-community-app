import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import 'controller/setting_controller.dart';

class ManageAccountSettingScreen extends StatelessWidget {
  const ManageAccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "MANAGE ACCOUNT",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  CustomText(
                    text: "Delete My Account",
                    size: 16.sp,
                    underline: true,
                    fontFamily: AppFontNames.gillSansBold,
                  ),
                  SizedBox(height: 16.h),
                  RichText(
                    text: TextSpan(
                      text: 'This will  ',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: AppFontNames.gillSans,
                        fontSize: 14.sp,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'permanently',
                            style: TextStyle(
                                fontFamily: AppFontNames.gillSansBold)),
                        TextSpan(
                            text:
                                '  delete all the data related to your account.'),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
