import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class CommunityItem extends StatelessWidget {
  final String title;
  final Widget? SubWidget;
  final String imgPath;
  final bool isSelected;

  const CommunityItem(
      {super.key,
      required this.title,
      required this.imgPath,
      required this.isSelected,
      this.SubWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85.h,
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.h, right: 28.w),
        margin: EdgeInsets.only(top: 16.h),
        decoration: BoxDecoration(
            border: Border.all(
          width: 1,
          color: isSelected ? AppColors.secondaryText : Colors.grey.shade400,
        )),
        child: Row(
          children: [
            Image.asset(
              "assets/images/$imgPath",
              height: 70.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textAlign: TextAlign.start,
                    text: title,
                    fontFamily: AppFontNames.gillSansBold,
                    size: SubWidget != null ? 14.sp : 16.sp,
                  ),
                  SubWidget ?? SizedBox(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: SubWidget != null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                if (SubWidget != null) SizedBox(height: 10.h),
                isSelected
                    ? SvgPicture.asset(
                        "assets/icons/rhmobus_filled_selected.svg")
                    : Transform.rotate(
                        alignment: Alignment.center,
                        angle: pi / 4,
                        child: Icon(
                          Icons.square_outlined,
                          size: 18.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
              ],
            ),
          ],
        ));
  }
}
