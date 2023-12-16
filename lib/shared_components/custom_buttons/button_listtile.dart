import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/styles.dart';
import '../custom_text.dart';

class CustomBtnListTile extends StatelessWidget {
  final String title;
  final String leadingImgPath;
  final String trailingImgPath;
  final Function()? onPress;
  const CustomBtnListTile({
    super.key,
    required this.title,
    required this.leadingImgPath,
    required this.trailingImgPath,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 67.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/$leadingImgPath"),
            SizedBox(width: 20.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 4.h),
                CustomText(
                  text: title,
                  fontFamily: AppFontNames.gillSansBold,
                  size: 16.sp,
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset("assets/icons/$trailingImgPath", height: 18.h),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
