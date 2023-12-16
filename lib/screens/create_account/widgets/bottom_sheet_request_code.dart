import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../../shared_components/custom_text_form_field.dart';
import '../controller/create_controller.dart';
import 'bottom_hint.dart';
import 'bottom_sheet_relationship_type.dart';
import 'custom_drop_container.dart';

class ReuestCodeBottomSheet extends StatelessWidget {
  const ReuestCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountCtrl>(
        init: CreateAccountCtrl(),
        builder: (controller) {
          return Container(
            height: 0.62.sh,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "REQUEST INVITAION CODE",
                        size: 18.sp,
                        fontFamily: AppFontNames.gillSansBold,
                      ),
                    ),
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
                SizedBox(height: 30.h),
                CustomTextFormField(
                  label: "Name*",
                  textInputType: TextInputType.text,
                  controller: controller.requestCodeNameCtr,
                ),
                SizedBox(height: 16.h),
                PhoneTextField(
                    controller: controller.requestCodeMobileNumberCtr,
                    suffix: SizedBox()),
                SizedBox(height: 16.h),
                GestureDetector(
                    onTap: () {
                      controller.openBottomSheet(
                          context, RelationshipTypeBottomSheet());
                    },
                    child: CustomDropContainer(
                      text: controller.selectedRelationName,
                      isValueChanged: controller.selectedRelationIndex != -1,
                    )),
                SizedBox(height: 16.h),
                PhoneTextField(
                    controller: controller.requestCodeOwnerMobileNOCtr,
                    suffix: SizedBox()),
                SizedBox(height: 16.h),
                BottomHint(
                  text: "Make sure you're using the same phone number"
                      " as the one registered with Palm Hills.",
                ),
                SizedBox(height: 16.h),
                CustomLargeButton(
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pop(context);
                    },
                    text: "Send Request to Owner"),
                SizedBox(height: 16.h),
              ],
            ),
          );
        });
  }
}
