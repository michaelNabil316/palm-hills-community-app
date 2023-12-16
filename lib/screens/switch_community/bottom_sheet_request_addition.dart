import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text_form_field.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../create_account/widgets/custom_drop_container.dart';
import 'addition_request_success_screen.dart';
import 'bottom_sheet_compoundes.dart';
import 'controller/switch_community_controller.dart';

class RequestAdditionBottomSheet extends StatelessWidget {
  const RequestAdditionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchCommunityCtrl>(
      init: SwitchCommunityCtrl(),
      builder: (controller) {
        return Container(
          height: 0.67.sh,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    CustomText(
                      text: "REQUEST ADDITION",
                      size: 18.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/close_icon.svg",
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                color: AppColors.whiteSugaer,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    CustomText(
                      text: "Mohamed Tarek",
                      size: 16.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset("assets/icons/phone_icon.svg"),
                        SizedBox(width: 8.h),
                        Column(
                          children: [
                            SizedBox(height: 3.h),
                            CustomText(
                              text: "+20 123 456789",
                              size: 16.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    InkWell(
                      child: CustomDropContainer(
                        text: controller.selectedNewCompoundName,
                        isValueChanged:
                            controller.selectedNewCompoundIndex != -1,
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return CompundesBottomSheetSwitch();
                          },
                        );
                      },
                    ),
                    SizedBox(height: 25.h),
                    CustomTextFormField(
                      label: "Request Note *",
                      textInputType: TextInputType.name,
                      controller: controller.requestNoteController,
                      maxLines: 6,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            size: 12.sp,
                            text:
                                "Max.characters: ${controller.requestNoteController.text.length}/200")
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomLargeButton(
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pop(context);
                        navigateTo(
                            context, AdditionRequestCompleteSuccessfuly());
                      },
                      text: "Request & Submit",
                      noIcon: true,
                      stopBtnActivity: controller.isButtonNotActive(),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
