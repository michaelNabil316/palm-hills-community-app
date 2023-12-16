import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../shared_components/custom_buttons/button_large.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../controllers/my_space_controller.dart';

AlertDialog deletePassAlert(context, String passId) {
  return AlertDialog(
    content: Container(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          SvgPicture.asset(
            "assets/icons/bin_icon.svg",
            height: 40.h,
          ),
          SizedBox(height: 20.h),
          CustomText(
            text: "Are you sure you want to delete this Pass?",
            size: 16.sp,
            fontFamily: AppFontNames.gillSansBold,
            color: AppColors.secondaryText,
          ),
          SizedBox(height: 20.h),
          CustomText(
            text: "This action cannot be undone.",
            size: 14.sp,
            color: Colors.grey,
          ),
          SizedBox(height: 30.h),
          CustomLargeButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Keep Pass",
            noIcon: true,
          ),
          SizedBox(height: 18.h),
          GetBuilder<MySpaceController>(
              init: MySpaceController(),
              builder: (con) {
                return GestureDetector(
                  onTap: () {
                    con.deletePass(passId);
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    text: "Permanently Delete Member",
                    size: 14.sp,
                    color: AppColors.secondaryText,
                    fontFamily: AppFontNames.gillSansBold,
                    underline: true,
                  ),
                );
              }),
          SizedBox(height: 5.h),
        ],
      ),
    ),
  );
}
