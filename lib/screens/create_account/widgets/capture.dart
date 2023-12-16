import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class CaptureCameraBtn extends StatelessWidget {
  final Function() onTap;
  final Function()? onTapNoFace;
  final bool isActive;
  final String? txt;
  const CaptureCameraBtn({
    super.key,
    required this.onTap,
    this.onTapNoFace,
    this.txt,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 36.r,
              backgroundColor: AppColors.primary,
              child: CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.white,
                child: txt != null ? CustomText(text: txt!) : null,
              ),
            ),
          )
        : SizedBox(
            width: 170,
            child: CustomLargeButton(
              onPressed: onTapNoFace ??
                  () {
                    log("message<>");
                  },
              noIcon: true,
              text: "No face detected",
              stopBtnActivity: true,
              backColor: Colors.grey.shade100,
            ),
          );
  }
}
