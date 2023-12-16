import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/forget_password/reset_password.dart';
import '../../helper/navigation.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import '../../shared_components/custom_buttons/button_large.dart';
import '../../shared_components/custom_text.dart';
import '../../shared_components/note_error_container.dart';
import '../../helper/styles.dart';
import '../create_account/widgets/otp_text_form.dart';
import 'controller/forget_pass_controller.dart';

class ForgetPasswordOtpScreen extends StatelessWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpFormKey = GlobalKey<FormState>();

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
                key: otpFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 85.h),
                      CustomText(
                        text: "Please enter the 4-digit number sent to",
                        size: 16.sp,
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        children: [
                          CustomText(
                            text: "0123456789",
                            size: 16.sp,
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: "Change",
                            size: 14.sp,
                            color: AppColors.primary,
                            fontFamily: AppFontNames.gillSansBold,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          OtpInput(
                              controller: controller.fieldOne, autoFocus: true),
                          SizedBox(width: 12.w),
                          OtpInput(
                              controller: controller.fieldTwo,
                              autoFocus: false),
                          SizedBox(width: 12.w),
                          OtpInput(
                              controller: controller.fieldThree,
                              autoFocus: false),
                          SizedBox(width: 12.w),
                          OtpInput(
                            controller: controller.fieldFour,
                            autoFocus: false,
                            isLastOne: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      if (controller.errorOtp != "")
                        ErrorContainer(text: controller.errorOtp),
                      SizedBox(height: 24.h),
                      if (controller.start != 0)
                        Row(
                          children: [
                            CustomText(
                              text: "Request a new code in",
                              size: 14.sp,
                            ),
                            SizedBox(width: 6.w),
                            CustomText(
                              text:
                                  "00:${controller.start > 9 ? controller.start : "0${controller.start}"}",
                              size: 14.sp,
                              color: AppColors.secondaryText,
                              fontFamily: AppFontNames.gillSansBold,
                            )
                          ],
                        )
                      else
                        GestureDetector(
                          child: CustomText(
                            text: "Resend a New Code",
                            size: 14.sp,
                            underline: true,
                            fontFamily: AppFontNames.gillSansBold,
                          ),
                          onTap: () {
                            controller.startTimer();
                          },
                        ),
                      SizedBox(height: 42.h),
                      CustomLargeButton(
                        stopBtnActivity: controller.stopVerfyBTN(),
                        text: "Verfiy",
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (!controller.stopVerfyBTN()) {
                            controller.checkOtpValidate();
                            if (controller.isOtpCorrect) {
                              navigateTo(context, ResetPasswordScreen());
                            } else {
                              controller.changeErrorMsg("OTP not correct");
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
        });
  }
}
