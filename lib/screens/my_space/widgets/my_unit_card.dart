import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class MyUnitCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? iconName;
  final bool? noForwardOcon;
  final Function()? onTap;
  const MyUnitCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.noForwardOcon,
    this.onTap,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        height: 76.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/${iconName ?? "home_outlite"}.svg"),
            SizedBox(width: 25.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    size: 16.sp,
                    fontFamily: AppFontNames.gillSansBold,
                  ),
                  CustomText(
                    text: subTitle,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            if (noForwardOcon != true)
              SvgPicture.asset("assets/icons/arrow_forward.svg"),
          ],
        ),
      ),
    );
  }
}
