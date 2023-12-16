import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../../shared_components/custom_text.dart';

class UploadCard extends StatelessWidget {
  final Function()? onTap;
  final String? imageBase64;
  const UploadCard({
    super.key,
    required this.onTap,
    required this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    return imageBase64 == null
        ? GestureDetector(
            onTap: onTap,
            child: DottedBorder(
              dashPattern: [8, 4],
              strokeWidth: 1,
              color: Colors.grey,
              child: Container(
                height: 120.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    SvgPicture.asset(
                      "assets/icons/car.svg",
                      color: AppColors.secondaryText,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Upload Car License",
                          size: 16.sp,
                          fontFamily: AppFontNames.gillSansBold,
                          underline: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: "PNG, JPG, JPEG. 2 MB Max",
                      color: Colors.grey,
                      size: 12.sp,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Image.memory(
            base64Decode(imageBase64!),
            // height: 120.h,
            // width: double.infinity,
            // fit: BoxFit.fitHeight,
          );
  }
}
