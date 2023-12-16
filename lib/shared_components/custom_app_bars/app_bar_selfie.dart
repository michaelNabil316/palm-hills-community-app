import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/styles.dart';
import '../custom_text.dart';

AppBar appBarWithSelfieImg(
    {required String title,
    String? subtitle,
    bool? noBackArrow,
    Function()? onPressBackBtn,
    ImageProvider<Object>? backgroundImage}) {
  return AppBar(
    toolbarHeight: 165.h,
    leading: const SizedBox(),
    flexibleSpace: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              SizedBox(height: 75.h),
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
                      SizedBox(height: 5.h),
                      CustomText(
                        text: title,
                        color: Colors.white,
                        fontFamily: AppFontNames.gillSansBold,
                        size: 16.sp,
                      ),
                    ],
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            ],
          ),
          //img
          Positioned(
            top: 140.h,
            child: Transform.flip(
              flipX: Platform.isAndroid ? true : false,
              child: CircleAvatar(
                radius: 90.r,
                backgroundColor: Colors.grey.shade100,
                backgroundImage: backgroundImage,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
