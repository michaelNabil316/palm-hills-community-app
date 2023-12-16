import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/screens/login/widgets/local_auth_success_dialog.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class LocalAuthDialog extends StatelessWidget {
  const LocalAuthDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
      content: Container(
          height: 275.h,
          width: 300.w,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              SvgPicture.asset(
                "assets/icons/face-id.svg",
                height: 44.h,
              ),
              SizedBox(height: 16.h),
              CustomText(
                size: 20.sp,
                text: "Face ID",
                fontFamily: AppFontNames.gillSansBold,
              ),
              SizedBox(height: 16.h),
              CustomText(
                size: 16.sp,
                text: "Touch the button to login",
              ),
              SizedBox(height: 35.h),
              CustomLargeButton(
                  onPressed: () async {
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return LocalAuthDialogSuccess();
                        });
                  },
                  text: "Use Face ID"),
              SizedBox(height: 28.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CustomText(
                  size: 16.sp,
                  text: "Cancel",
                  underline: true,
                  fontFamily: AppFontNames.gillSansBold,
                ),
              ),
            ],
          )),
    );
  }
}
