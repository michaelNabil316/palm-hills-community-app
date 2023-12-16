import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';

class MoreCard extends StatelessWidget {
  const MoreCard(
      {super.key,
      required this.fun,
      required this.IconPath,
      required this.subTitle,
      required this.title});

  final VoidCallback fun;
  final String title, subTitle, IconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        width: double.infinity,
        //height: 100.h,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20.w),
                SvgPicture.asset(
                  IconPath,
                  width: 25.w,
                  height: 15.h,
                ),
                SizedBox(width: 10.w),
                CustomText(
                  text: title,
                  color: AppColors.secondaryText,
                  size: 16.sp,
                  fontFamily: AppFontNames.gillSansBold,
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrow_forward.svg",
                  width: 25.w,
                  height: 15.h,
                ),
                SizedBox(width: 20.w),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 47.w),
              child: CustomText(
                textAlign: TextAlign.start,
                text: subTitle,
                size: 14.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
