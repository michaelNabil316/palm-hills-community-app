import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../../shared_components/custom_text.dart';

class LanguageChecker extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function()? onTap;
  const LanguageChecker({
    super.key,
    this.onTap,
    required this.title,
    required this.isSelected,
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
            CustomText(
              text: title,
              fontFamily: isSelected
                  ? AppFontNames.gillSansBold
                  : AppFontNames.gillSans,
            ),
            Spacer(),
            isSelected
                ? SvgPicture.asset("assets/icons/rhmobus_filled_selected.svg")
                : Transform.rotate(
                    alignment: Alignment.center,
                    angle: pi / 4,
                    child: Icon(
                      Icons.square_outlined,
                      size: 19.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
