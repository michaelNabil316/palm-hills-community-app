import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/constants.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/note_container.dart';
import 'package:palm_hills/shared_components/note_error_container.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../shared_components/custom_text_form_field.dart';
import 'controller/change_pass_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changeFormKey = GlobalKey<FormState>();

    return GetBuilder<ChangePasswordCtrl>(
        init: ChangePasswordCtrl(),
        builder: (controller) {
          return Scaffold(
            appBar: appBarOneLineWithIcon(
              title: "CHANGE PASSWORD",
              plusWidget: SizedBox(width: 25.w),
              onPressPluskBtn: () {},
              onPressBackBtn: () => Navigator.pop(context),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: changeFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      CustomTextFormField(
                          isPassword: controller.hideCurrentPass,
                          label: "Current Password *",
                          textInputType: TextInputType.text,
                          controller: controller.currentPassController,
                          onChange: (value) {
                            controller.changeBtnActivity();
                          },
                          suffix: GestureDetector(
                            onTap: () {
                              controller.changeHideCurrentPass();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  "assets/icons/${controller.hideCurrentPass ? "closed_eye.svg" : "opened_eye.svg"}"),
                            ),
                          ),
                          validate: (value) {
                            if (value == null) {
                              return "Field is required";
                            }
                            if (value.isEmpty) {
                              return "Field is required";
                            }
                          }),
                      SizedBox(height: 30.h),
                      CustomTextFormField(
                          isPassword: controller.hideNewPass,
                          label: "New Password *",
                          textInputType: TextInputType.text,
                          controller: controller.newPassController,
                          onChange: (value) {
                            controller.changeBtnActivity();
                          },
                          suffix: GestureDetector(
                            onTap: () {
                              controller.changeHideNewPass();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  "assets/icons/${controller.hideNewPass ? "closed_eye.svg" : "opened_eye.svg"}"),
                            ),
                          ),
                          onTap: () {
                            controller.showPasswordHint(true);
                          },
                          validate: (value) {
                            if (value == null) {
                              return "Field is required";
                            }
                            if (value.isEmpty) {
                              return "Field is required";
                            }
                          }),
                      SizedBox(height: 20.h),
                      if (controller.passwordHint)
                        NoteContainer(text: Constants.passwordHint),
                      SizedBox(height: 20.h),
                      if (controller.errorMsg != "")
                        ErrorContainer(text: controller.errorMsg),
                      SizedBox(height: 20.h),
                      CustomLargeButton(
                        stopBtnActivity: controller.stopBtnActivity,
                        onPressed: () async {
                          controller.showPasswordHint(false);
                          if (changeFormKey.currentState?.validate() == true) {
                            bool isError = controller.isErrorMsg();
                            if (isError == false) {
                              await controller.changePassword(context);
                            }
                          }
                        },
                        noIcon: true,
                        text: "Save & Update",
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
