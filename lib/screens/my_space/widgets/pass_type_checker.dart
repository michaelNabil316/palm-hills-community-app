import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../../shared_components/custom_text.dart';

class PassTypeChecker extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function()? onTap;
  const PassTypeChecker({
    super.key,
    this.onTap,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            CustomText(
              text: title,
              color: isSelected ? AppColors.primary : AppColors.secondaryText,
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
