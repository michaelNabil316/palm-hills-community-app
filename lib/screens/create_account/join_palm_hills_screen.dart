import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../helper/constants.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import '../../shared_components/custom_buttons/button_large.dart';
import '../home/main_page_bottom_nav.dart';
import 'controller/create_controller.dart';
import 'create_account_screen.dart';
import '../login/login_screen.dart';
import 'widgets/radio_button_squared.dart';

class JoinPalmHillsScreen extends StatelessWidget {
  const JoinPalmHillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMultinLine(
          title: "JOIN PALM HILLS",
          subtitle: "COMMUNITY APP",
          noBackArrow: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: GetBuilder<CreateAccountCtrl>(
            init: CreateAccountCtrl(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Row(children: [
                    CustomText(
                      text: "I am a(n)...",
                      size: 16.sp,
                    )
                  ]),
                  SizedBox(height: 8.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: accountsCreations.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.changeSelectedAccount(index);
                      },
                      child: CustomRadioButton(
                        title: accountsCreations[index]["name"]!,
                        imgPath: accountsCreations[index]["img_path"]!,
                        isSelected: controller.selectedIndex == index,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomLargeButton(
                    text: "Create Account",
                    onPressed: () {
                      navigateTo(
                        context,
                        CreateAccountScreen(
                          accountName:
                              accountsCreations[controller.selectedIndex]
                                  ['name']!,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () async {
                      await Future.delayed(Duration(seconds: 2));
                      navigateTo(context, MainPageBottomNav());
                    },
                    child: CustomText(
                      text: "Continue as a Guest",
                      size: 16.sp,
                      fontFamily: AppFontNames.gillSansBold,
                      underline: true,
                      bolUnderline: true,
                    ),
                  ),
                  SizedBox(height: 130.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: "Already have an account? ",
                        size: 14.sp,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateAndFinish(context, LoginScreen());
                        },
                        child: CustomText(
                          text: "Log In",
                          size: 14.sp,
                          color: AppColors.primary,
                          fontFamily: AppFontNames.gillSansBold,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
