import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../helper/styles.dart';

var textRequestCode = [
  WidgetSpan(child: SvgPicture.asset("assets/icons/hint_lamp.svg")),
  TextSpan(
    text: " Don't have an invitation code?",
    style: TextStyle(
        color: Colors.grey,
        fontSize: 12.sp,
        fontFamily: AppFontNames.gillSansMedium),
  ),
  TextSpan(text: "\n"),
  TextSpan(
    text: "      Request code from owner",
    onEnter: (ppp) {
      print("pppppp");
    },
    style: TextStyle(
        color: AppColors.primary,
        fontSize: 12.sp,
        fontFamily: AppFontNames.gillSansBold),
  ),
];
