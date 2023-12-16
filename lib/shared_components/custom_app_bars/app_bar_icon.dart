import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar appBarWithIcon({bool? withBack, Function()? onTapBackBtn}) {
  return AppBar(
    toolbarHeight: 165.h,
    leading: const SizedBox(),
    flexibleSpace: Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        if (withBack == true)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Row(
                children: [
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: onTapBackBtn ?? () {},
                    child: SvgPicture.asset(
                      "assets/icons/arrow_back.svg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        Positioned(
          top: 158.h,
          child: SvgPicture.asset("assets/icons/document_success.svg"),
        ),
      ],
    ),
  );
}
