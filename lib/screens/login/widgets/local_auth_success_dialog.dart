import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class LocalAuthDialogSuccess extends StatelessWidget {
  const LocalAuthDialogSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      content: Container(
        height: 160.h,
        width: 300.w,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/face-id.svg",
              height: 44.h,
              color: Colors.green,
            ),
            SizedBox(height: 16.h),
            CustomText(
              size: 20.sp,
              text: "Face ID",
              fontFamily: AppFontNames.gillSansBold,
            ),
            SizedBox(height: 16.h),
            CustomLargeButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: "Done"),
          ],
        ),
      ),
    );
  }
}
