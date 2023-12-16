import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import '../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import '../../shared_components/custom_buttons/button_large.dart';
import '../../shared_components/custom_text.dart';
import '../../shared_components/note_error_container.dart';
import 'controller/forget_pass_controller.dart';
import 'otp_forget_password_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final numberFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassCtrl>(
      init: ForgetPassCtrl(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarMultinLine(
            title: "FORGET PASSWORD",
            onPressBackBtn: () => Navigator.of(context).pop(),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: numberFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    CustomText(
                      text:
                          "Enter the mobile number registered with Palm Hills.",
                    ),
                    SizedBox(height: 26.h),
                    PhoneTextField(
                      controller: controller.mobileController,
                      changeSelectedDialCode: controller.changeSelectedDialCode,
                      onChange: controller.onChangeEmail,
                    ),
                    SizedBox(height: 24.h),
                    CustomText(
                      textAlign: TextAlign.start,
                      text:
                          "We will send you a code to verify your number, then you can reset your password.",
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 22.h),
                    if (controller.errorMsg != "")
                      ErrorContainer(text: controller.errorMsg),
                    SizedBox(height: 22.h),
                    CustomLargeButton(
                      stopBtnActivity: controller.stopSendBtn,
                      text: "Send Code",
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (numberFormKey.currentState?.validate() == true) {
                          final isOtpSend = await controller.startProcess();
                          if (isOtpSend == true) {
                            controller.startTimer();
                            navigateTo(context, ForgetPasswordOtpScreen());
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
