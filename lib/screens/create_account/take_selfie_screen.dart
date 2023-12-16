import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_selfie.dart';
import '../../shared_components/note_error_container.dart';
import 'controller/create_controller.dart';
import 'create_complete_successfuly.dart';
import 'widgets/bottom_hint.dart';
import 'widgets/circle_camera_btn.dart';

class TakeSelfieScreen extends StatelessWidget {
  const TakeSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountCtrl>(
      init: CreateAccountCtrl(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarWithSelfieImg(
            title: "TAKE A SELFIE",
            onPressBackBtn: () => Navigator.pop(context),
            backgroundImage: controller.selfieImagePath != null
                ? FileImage(File(controller.selfieImagePath!))
                : null,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: (controller.selfieImagePath == null)
                ? Column(
                    children: [
                      SizedBox(height: 180.h, width: 1.sw),
                      CustomText(
                        text: "Tap camera button to take photo",
                        fontFamily: AppFontNames.gillSansBold,
                        size: 20.sp,
                      ),
                      SizedBox(height: 40.h),
                      CircleCameraBtn(
                        onTap: () async {
                          bool haveAccess =
                              await controller.checkCameraPermission();
                          if (haveAccess) {
                            await controller
                                .navigateAndDisplaySelection(context);
                          }
                        },
                      ),
                      if (controller.errorMsg != "") SizedBox(height: 40.h),
                      if (controller.errorMsg != "")
                        ErrorContainer(text: controller.errorMsg),
                      const Spacer(),
                      BottomHint(
                        text: "Your selfie will also be used on your"
                            " community gate pass and the app's profile.",
                      ),
                      SizedBox(height: 40.h)
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(height: 180.h, width: 1.sw),
                      CustomLargeButton(
                        onPressed: () {
                          navigateTo(context, CreateCompleteSuccessfuly());
                        },
                        text: "Submit",
                        noIcon: true,
                      ),
                      SizedBox(height: 50.h),
                      InkWell(
                        onTap: () async {
                          await controller.navigateAndDisplaySelection(context);
                        },
                        child: CustomText(
                          text: "Retake",
                          fontFamily: AppFontNames.gillSansBold,
                          underline: true,
                          size: 14.sp,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
