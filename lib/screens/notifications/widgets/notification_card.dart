import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import 'dart:math' as math;

class NotificationCard extends StatelessWidget {
  final bool isNew;
  final String iconPath;
  final String date;
  final String body;
  final String navigationTxt;
  final Function() navigationFun;

  const NotificationCard({
    super.key,
    required this.isNew,
    required this.iconPath,
    required this.date,
    required this.body,
    required this.navigationTxt,
    required this.navigationFun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122.h,
      width: double.infinity,
      color: isNew ? Color.fromRGBO(248, 248, 248, 1) : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15.r,
            backgroundColor: AppColors.primary.withOpacity(0.15),
            child: SvgPicture.asset("assets/icons/$iconPath"),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textAlign: TextAlign.start,
                  text: body,
                  size: 16.sp,
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: navigationFun,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: navigationTxt,
                        color: AppColors.primary,
                        fontFamily: AppFontNames.gillSansBold,
                      ),
                      SizedBox(width: 2.w),
                      Transform.rotate(
                        angle: math.pi,
                        child: SvgPicture.asset(
                          "assets/icons/arrow_back.svg",
                          color: AppColors.primary,
                          height: 14.h,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 12.w),
          CustomText(
            text: date,
            color: Colors.grey,
            size: 14.sp,
          )
        ],
      ),
    );
  }
}
