import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import 'package:flutter/cupertino.dart' as cup;

class SettingSwitcherCard extends StatelessWidget {
  const SettingSwitcherCard({
    super.key,
    required this.IconPath,
    required this.subTitle,
    required this.title,
    required this.onChanged,
    required this.switchValue,
  });

  final String title, subTitle, IconPath;
  final Function(bool) onChanged;
  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 112.h,
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
              ),
              SizedBox(width: 10.w),
              Column(
                children: [
                  SizedBox(height: 3.h),
                  CustomText(
                    text: title,
                    color: AppColors.secondaryText,
                    size: 16.sp,
                    fontFamily: AppFontNames.gillSansBold,
                  ),
                ],
              ),
              Spacer(),
              Transform.scale(
                scale: 0.8,
                child: cup.CupertinoSwitch(
                  value: switchValue,
                  onChanged: onChanged,
                ),
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
    );
  }
}
