import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../../helper/styles.dart';

Widget CustomToolTipSimple({required Function(int) onTap}) => PopupMenuButton(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset("assets/icons/exclamation_mark.svg"),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/icons/hint_lamp.svg"),
                SizedBox(width: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 2),
                    CustomText(
                      text: "Don't have an invitation code?",
                      color: Colors.grey,
                      size: 12.sp,
                    ),
                    CustomText(
                      text: "Request code from owner",
                      color: AppColors.primary,
                      fontFamily: AppFontNames.gillSansBold,
                      size: 12.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ];
      },
      onSelected: onTap,
    );
