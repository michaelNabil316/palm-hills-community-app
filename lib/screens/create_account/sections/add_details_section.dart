import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/phone_flages/phone_number_txtformfield.dart';
import '../widgets/bottom_sheet_pick_date.dart';
import '../widgets/tooltip_simple.dart';
import '../../../shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text_form_field.dart';
import '../controller/create_controller.dart';
import '../widgets/bottom_sheet_request_code.dart';
import '../widgets/create_account_road_map_item.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountCtrl>(
      init: CreateAccountCtrl(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 42.h),
                  //const CreateAccountRoadMap(index: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CreateAccountRoadMapItem(
                          index: 0, currentIndex: 0, text: "Add details"),
                      if (controller.selectedIndex == 0)
                        CreateAccountRoadMapItem(
                            index: 0, currentIndex: 1, text: "Verfiy Number"),
                      CreateAccountRoadMapItem(
                          index: 0,
                          currentIndex: controller.selectedIndex == 0 ? 2 : 1,
                          text: "Check Identity"),
                    ],
                  ),
                  SizedBox(height: 42.h),
                  CustomText(
                    text: "ADD DETAILS",
                    fontFamily: AppFontNames.gillSansBold,
                    size: 18.sp,
                  ),
                  SizedBox(height: 24.h),
                  if (controller.selectedIndex == 0)
                    CustomTextFormField(
                      label: "Name*",
                      textInputType: TextInputType.text,
                      controller: controller.nameController,
                    ),
                  if (controller.selectedIndex == 0) SizedBox(height: 16.h),
                  if (controller.selectedIndex == 0)
                    PhoneTextField(controller: controller.mobileController),
                  if (controller.selectedIndex == 2)
                    CustomTextFormField(
                      label: "Invitation Code*",
                      textInputType: TextInputType.text,
                      controller: controller.invitationCodeController,
                      suffix: CustomToolTipSimple(
                        onTap: (v) {
                          FocusScope.of(context).unfocus();
                          controller.openBottomSheet(
                              context, ReuestCodeBottomSheet());
                        },
                      ),
                    ),
                  SizedBox(height: 16.h),
                  if (controller.selectedIndex == 2)
                    CustomTextFormField(
                      label: "Date of Birth *",
                      textInputType: TextInputType.text,
                      controller: controller.dateOfBirthController,
                      suffix: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset("assets/icons/calender.svg"),
                      ),
                      readOnly: true,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.openBottomSheet(
                            context, IosDatePickerBottomSheet());
                      },
                    ),
                  if (controller.selectedIndex == 2) SizedBox(height: 16.h),
                  if (!controller.isFamilyMemberblewThan15years())
                    CustomTextFormField(
                      label: "National ID*",
                      textInputType: TextInputType.number,
                      controller: controller.nationalIdController,
                    ),
                  if (!controller.isFamilyMemberblewThan15years())
                    SizedBox(height: 16.h),
                  CustomTextFormField(
                    label: "Email*",
                    textInputType: TextInputType.text,
                    controller: controller.emailController,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    isPassword: controller.hidePass,
                    label: "Password*",
                    textInputType: TextInputType.text,
                    controller: controller.passwordController,
                    suffix: GestureDetector(
                      onTap: controller.changeShowPass,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                            "assets/icons/${controller.hidePass ? "closed_eye.svg" : "opened_eye.svg"}"),
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h),

                  SizedBox(height: 35.h),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100.h,
            //width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, -3),
              ),
            ]),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                CustomLargeButton(
                  text: "Submit & Continue",
                  onPressed: controller.nextSection,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
