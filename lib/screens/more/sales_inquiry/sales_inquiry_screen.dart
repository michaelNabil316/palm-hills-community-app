import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../../shared_components/custom_text_form_field.dart';
import '../../create_account/widgets/custom_drop_container.dart';
import 'controller/sales_inquiry_controller.dart';
import 'widgets/bottom_sheet_compunds.dart';

class SalesInquiryScreen extends StatelessWidget {
  const SalesInquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "SALES & INQUIRY",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GetBuilder<SalesInquiryCtrl>(
            init: SalesInquiryCtrl(),
            builder: (con) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: "Leave us your contact details "
                        "& we will get back to you.",
                    size: 16.sp,
                  ),
                  SizedBox(height: 35.h),
                  CustomTextFormField(
                    label: "Name*",
                    textInputType: TextInputType.text,
                    controller: con.nameController,
                    readOnly: con.readOnly,
                    fillColor: !con.readOnly ? AppColors.whiteSugaer : null,
                  ),
                  SizedBox(height: 16.h),
                  PhoneTextField(
                    controller: con.phoneController,
                    fillColor: !con.readOnly ? AppColors.whiteSugaer : null,
                    showPrefix: true,
                    readOnly: con.readOnly,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    label: "Email*",
                    textInputType: TextInputType.text,
                    controller: con.emailController,
                    readOnly: con.readOnly,
                    fillColor: !con.readOnly ? AppColors.whiteSugaer : null,
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SalesInquirySelectCompondsBottomSheet();
                        },
                      );
                    },
                    child: CustomDropContainer(
                      text: con.selectedCompound,
                      isValueChanged: con.selectedCompoundIndex != -1,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  CustomTextFormField(
                    label: "Request Note *",
                    textInputType: TextInputType.name,
                    controller: con.msgController,
                    maxLines: 6,
                    onChange: (v) {
                      con.changeCharachtersCounter(v);
                    },
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        size: 12.sp,
                        text: "Max.characters: "
                            "${con.charachters}/200",
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomLargeButton(
                    noIcon: true,
                    stopBtnActivity: con.HideBtn(),
                    onPressed: () async {
                      if (!con.HideBtn()) {
                        print("object");
                        //await con.sendUsAMsg(context);
                      }
                    },
                    text: "Submit",
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
