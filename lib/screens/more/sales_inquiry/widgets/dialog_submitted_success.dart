import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../../helper/navigation.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../../../home/main_page_bottom_nav.dart';

class SubmittedSuccessDialog extends StatelessWidget {
  final String text;
  const SubmittedSuccessDialog({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      content: Container(
        height: 330.h,
        width: 300.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/document_success.svg",
              height: 44.h,
            ),
            SizedBox(height: 16.h),
            CustomText(
              size: 20.sp,
              text: text,
              fontFamily: AppFontNames.gillSansBold,
            ),
            SizedBox(height: 16.h),
            CustomText(
              size: 16.sp,
              text: "Your message has been received successfully.  "
                  "One of our representatives will get back to your "
                  "neighbor within 24-48 hours.",
            ),
            Spacer(),
            CustomText(
              size: 14.sp,
              text: "Until then...",
            ),
            SizedBox(height: 5.h),
            CustomLargeButton(
              onPressed: () {
                Navigator.pop(context);
                navigateAndFinish(context, MainPageBottomNav());
              },
              text: "Go to Hills Today",
            ),
          ],
        ),
      ),
    );
  }
}
