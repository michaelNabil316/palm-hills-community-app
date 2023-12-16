import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../../shared_components/custom_text_form_field.dart';
import 'controller/chooce_your_neighbour_controller.dart';

class ChooseYourNeighbourScreen extends StatelessWidget {
  const ChooseYourNeighbourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "CHOOCE YOUR NEIGHBOUR",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GetBuilder<ChooseYourNeighbourCtrl>(
            init: ChooseYourNeighbourCtrl(),
            builder: (con) {
              return Form(
                key: con.chooceFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45.h),
                    CustomText(
                      textAlign: TextAlign.start,
                      text: "Just send their contact details "
                          "& we will get back to them.",
                      size: 16.sp,
                    ),
                    SizedBox(height: 35.h),
                    CustomTextFormField(
                      label: "His/Her Name*",
                      textInputType: TextInputType.text,
                      controller: con.nameController,
                      onChange: (value) => con.changeValidForm(),
                      validate: (value) {
                        if (value == null) {
                          return "Field is required";
                        }
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                    ),
                    SizedBox(height: 16.h),
                    PhoneTextField(controller: con.phoneController),
                    SizedBox(height: 25.h),
                    CustomTextFormField(
                      label: "Addition Notes *",
                      textInputType: TextInputType.name,
                      controller: con.msgController,
                      maxLines: 6,
                      onTap: () => con.changeValidForm(),
                      onChange: (v) {
                        con.changeMsgCounter(v);
                        con.changeValidForm();
                      },
                      validate: (value) {
                        if (value == null) {
                          return "Field is required";
                        }
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          size: 12.sp,
                          text: "Max.characters: "
                              "${con.msgCounter}/200",
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CustomLargeButton(
                      noIcon: true,
                      stopBtnActivity: con.hideBtn,
                      onPressed: () async {
                        if (con.chooceFormKey.currentState!.validate()) {
                          await con.postRequest(context);
                        }
                      },
                      text: "Submit",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
