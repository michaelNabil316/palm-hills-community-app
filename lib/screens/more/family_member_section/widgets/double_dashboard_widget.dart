import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../shared_components/divider_vertical.dart';
import '../../../../helper/styles.dart';

class DoubleDashBoardCard extends StatelessWidget {
  final String compound;
  final String relation;
  const DoubleDashBoardCard({
    super.key,
    required this.compound,
    required this.relation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30),
      color: AppColors.whiteSugaer,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                SvgPicture.asset("assets/icons/phone_icon.svg"),
                SizedBox(height: 10.h),
                CustomText(
                  text: compound,
                  size: 14.sp,
                ),
              ],
            ),
          ),
          CustomVerticalDivider(
            height: 70.h,
            marginHorizontal: 30.w,
            color: Colors.black12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                SvgPicture.asset("assets/icons/person_logo.svg"),
                SizedBox(height: 10.h),
                CustomText(
                  text: relation,
                  size: 14.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
