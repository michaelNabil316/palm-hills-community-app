import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../../shared_components/custom_text.dart';
import '../../../shared_components/custom_text_form_field.dart';
import '../../../shared_components/two_colored_titles.dart';
import '../../../helper/styles.dart';
import '../../create_account/widgets/custom_drop_container.dart';
import 'bottom_sheets/bottom_sheet_access_rights.dart';
import 'bottom_sheets/bottom_sheet_relationship_type.dart';
import 'controller/family_controller.dart';
import 'widgets/one_line_radio_card.dart';

class AddNewMemberScreen extends StatelessWidget {
  const AddNewMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "Family Member",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GetBuilder<FamilyCtrl>(
            init: FamilyCtrl(),
            builder: (con) {
              return Column(
                children: [
                  SizedBox(height: 40.h),
                  CustomTextFormField(
                    label: "Name*",
                    textInputType: TextInputType.text,
                    controller: con.fullNameController,
                  ),
                  SizedBox(height: 16.h),
                  PhoneTextField(controller: con.mobileController),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return RelationshipTypeBottomSheetMore();
                        },
                      );
                    },
                    child: CustomDropContainer(
                      text: con.selectedRelationName,
                      isValueChanged: con.selectedRelationIndex != -1,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  TwoColoredTexts(txt1: "GATE", txt2: "PASSES"),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      CustomText(
                          text: "Manage member's compound gate passes",
                          size: 16.sp,
                          color: Colors.grey)
                    ],
                  ),
                  SizedBox(height: 32.h),
                  OneLineSwitchRadio(
                    isSelected: con.palmSwitcherNewMember,
                    text: "Palm Hills Katameya",
                    onChanged: (value) {
                      con.changePalmSwitcherNewMember(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  OneLineSwitchRadio(
                    isSelected: con.hacindaSwitcherNewMember,
                    text: "Hacienda Bay",
                    onChanged: (value) {
                      con.changeHacindaSwitcherNewMember(value);
                    },
                  ),
                  SizedBox(height: 30.h),
                  if (con.hacindaSwitcherNewMember || con.palmSwitcherNewMember)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            CustomText(
                              text: "ACCESS ",
                              size: 18.sp,
                              fontFamily: AppFontNames.gillSansBold,
                            ),
                            CustomText(
                              text: "RIGHTS",
                              color: AppColors.primary,
                              size: 18.sp,
                              fontFamily: AppFontNames.gillSansBold,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        CustomText(
                          text: "For the added compounds",
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.h),
                        BottomSheetRow(
                            ICON: Icons.check,
                            Title: "Generate guests' gate and beach passes",
                            isTrue: true),
                        SizedBox(height: 10.h),
                        BottomSheetRow(
                            ICON: Icons.check,
                            Title: "Generate driver/help gate passes",
                            isTrue: true),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  SizedBox(height: 16.h),
                  CustomLargeButton(
                      stopBtnActivity: !con.isThereChangeHappenedNewMember(),
                      onPressed: () {},
                      text: "Send Invitation Code"),
                  SizedBox(height: 40.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
