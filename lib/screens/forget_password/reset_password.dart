import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/screens/login/login_screen.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import '../../shared_components/custom_buttons/button_large.dart';
import '../../shared_components/custom_text.dart';
import '../../shared_components/custom_text_form_field.dart';
import '../../shared_components/note_error_container.dart';
import 'controller/forget_pass_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final resetFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassCtrl>(
      init: ForgetPassCtrl(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarMultinLine(
            title: "Reset PASSWORD",
            onPressBackBtn: () => Navigator.of(context).pop(),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: resetFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    CustomText(
                      textAlign: TextAlign.start,
                      text:
                          "Create a new password for your Palm Hills Community app.",
                    ),
                    SizedBox(height: 26.h),
                    CustomTextFormField(
                      isPassword: controller.hidePass,
                      label: "Password*",
                      textInputType: TextInputType.text,
                      controller: controller.passwordController,
                      validate: (value) {
                        if (value == null) {
                          return "Field is required";
                        }
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                      suffix: GestureDetector(
                        onTap: controller.changehidePass,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                              "assets/icons/${controller.hidePass ? "closed_eye.svg" : "opened_eye.svg"}"),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(height: 22.h),
                    if (controller.errorMsg != "")
                      ErrorContainer(text: controller.errorMsg),
                    SizedBox(height: 22.h),
                    CustomLargeButton(
                      stopBtnActivity: controller.stopSendBtn,
                      text: "Set as New Password",
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (resetFormKey.currentState?.validate() == true) {
                          final errorFlag = await controller.resetPassword();
                          if (errorFlag == false) {
                            navigateTo(context, LoginScreen());
                          }
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
