import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/styles.dart';
import '../custom_text.dart';

AppBar appBarOneLine({
  required String title,
  String? subtitle,
  bool? noBackArrow,
  Function()? onPressBackBtn,
  double? allHeight,
  double? titleSize,
}) {
  return AppBar(
    toolbarHeight: allHeight ?? 95.h,
    leading: const SizedBox(),
    flexibleSpace: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 60.h - (subtitle != null ? 10 : 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onPressBackBtn,
                child: Container(
                  padding: EdgeInsets.only(bottom: 5, top: 5, right: 10),
                  child: SvgPicture.asset(
                    "assets/icons/arrow_back.svg",
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 3.h),
                  CustomText(
                    text: title,
                    color: Colors.white,
                    fontFamily: AppFontNames.gillSansBold,
                    size: titleSize ?? 16.sp,
                  ),
                  SizedBox(height: 6.h),
                  if (subtitle != null)
                    CustomText(
                      text: subtitle,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                ],
              ),
              SizedBox(width: 24.w),
            ],
          ),
          SizedBox(height: 18.h),
        ],
      ),
    ),
  );
}
