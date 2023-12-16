import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../shared_components/custom_buttons/button_large.dart';
import '../controller/create_controller.dart';
// import '../widgets/create_account_road_map.dart';
import '../widgets/create_account_road_map_item.dart';
import '../widgets/otp_text_form.dart';

class VerfiyNumber extends StatelessWidget {
  const VerfiyNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final otpFormKey = GlobalKey<FormState>();
    return GetBuilder<CreateAccountCtrl>(
        init: CreateAccountCtrl(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: otpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 42.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CreateAccountRoadMapItem(
                            index: 1, currentIndex: 0, text: "Add details"),
                        if (controller.selectedIndex == 0)
                          CreateAccountRoadMapItem(
                              index: 1, currentIndex: 1, text: "Verfiy Number"),
                        CreateAccountRoadMapItem(
                            index: 1,
                            currentIndex: controller.selectedIndex == 0 ? 2 : 1,
                            text: "Check Identity"),
                      ],
                    ),
                    SizedBox(height: 42.h),
                    CustomText(
                      text: "VERFIY NUMBER",
                      fontFamily: AppFontNames.gillSansBold,
                      size: 18.sp,
                    ),
                    SizedBox(height: 24.h),
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
                            controller: controller.fieldTwo, autoFocus: false),
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
                      InkWell(
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
                    SizedBox(height: 280.h),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: controller.pressBack,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: 31.r,
                            child: CircleAvatar(
                              radius: 30.r,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                "assets/icons/arrow_back.svg",
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: CustomLargeButton(
                            stopBtnActivity: controller.start == 0 ||
                                controller.fieldOne.text.isEmpty ||
                                controller.fieldTwo.text.isEmpty ||
                                controller.fieldThree.text.isEmpty ||
                                controller.fieldFour.text.isEmpty,
                            text: "Verfiy & Continue",
                            onPressed: controller.nextSection,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
