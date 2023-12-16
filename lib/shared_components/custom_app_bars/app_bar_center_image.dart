import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/styles.dart';
import 'app_bar_multiline_with_image.dart';

AppBar appBarCenterImage({
  String? imgPath,
  Function()? onPressBackBtn,
}) {
  return AppBar(
    backgroundColor: AppColors.secondaryText,
    toolbarHeight: 95.h,
    leading: const SizedBox(),
    flexibleSpace: Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(height: Platform.isIOS ? 105.h : 75.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: InkWell(
                onTap: onPressBackBtn,
                child: SvgPicture.asset(
                  "assets/icons/arrow_back.svg",
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: Platform.isIOS
              ? 116.h
              : bigAndroidScreen()
                  ? 83.h
                  : 90.h,
          child: RhombusImage(
            imagePath: imgPath ??
                "https://as1.ftcdn.net/v2/jpg/02/30/60/82/1000_F_230608264_fhoqBuEyiCPwT0h9RtnsuNAId3hWungP.jpg",
            rhombusSize: 75.h,
          ),
        ),
      ],
    ),
  );
}
