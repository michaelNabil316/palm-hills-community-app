import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class SettingItem extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String imgName;
  final double? svgHeight;

  const SettingItem({
    super.key,
    required this.text,
    required this.imgName,
    this.onTap,
    this.svgHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/${imgName}.svg",
              color: AppColors.secondaryText,
              height: svgHeight,
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Row(
                children: [
                  CustomText(
                    text: text,
                    size: 16.sp,
                    fontFamily: AppFontNames.gillSansBold,
                  )
                ],
              ),
            ),
            SizedBox(width: 25.w),
            SvgPicture.asset("assets/icons/arrow_forward.svg")
          ],
        ),
      ),
    );
  }
}
