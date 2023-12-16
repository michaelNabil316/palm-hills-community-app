import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../shared_components/custom_text.dart';
import '../../shared_components/custom_text_form_field.dart';
import '../../helper/styles.dart';
import 'controllers/my_space_controller.dart';
import 'widgets/calender.dart';

class DateFromToBottomSheet extends StatelessWidget {
  const DateFromToBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySpaceController>(
      init: MySpaceController(),
      builder: (con) {
        return Container(
          color: Colors.white,
          height: 0.53.sh,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  InkWell(
                    onTap: () => con.changeSelectedDate(false),
                    child: Container(
                      color: Colors.white,
                      width: 50.w,
                      child: SvgPicture.asset(
                        "assets/icons/arrow_back.svg",
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: "${con.handleSelectedMonth()}",
                      size: 18.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                  ),
                  InkWell(
                    onTap: () => con.changeSelectedDate(true),
                    child: Transform.rotate(
                      angle: pi,
                      child: Container(
                        color: Colors.white,
                        width: 50.w,
                        child: SvgPicture.asset(
                          "assets/icons/arrow_back.svg",
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 1.sw * 0.44,
                      height: 50.h,
                      child: CustomTextFormField(
                        label: "Start Date",
                        textInputType: TextInputType.name,
                        controller: con.startDateController,
                        focusNode: con.startDateFocusNode,
                        readOnly: true,
                        autofocus: true,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 1.sw * 0.44,
                      height: 50.h,
                      child: CustomTextFormField(
                        label: "End Date",
                        textInputType: TextInputType.name,
                        controller: con.endDateController,
                        focusNode: con.endDateFocusNode,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CustomCalender(),
            ],
          ),
        );
      },
    );
  }
}
