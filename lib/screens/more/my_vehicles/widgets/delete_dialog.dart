import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';

class DeleteVehicleDialog extends StatelessWidget {
  final Function() onDelete;
  const DeleteVehicleDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      content: Container(
          height: 324.h,
          width: 300.w,
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/bin_icon.svg",
                height: 44.h,
              ),
              SizedBox(height: 16.h),
              CustomText(
                size: 20.sp,
                text: "Are you sure you want to delete this Vehicle?",
                fontFamily: AppFontNames.gillSansBold,
              ),
              SizedBox(height: 16.h),
              CustomText(
                size: 16.sp,
                color: Colors.grey,
                text: "This action cannot be undone.",
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomLargeButton(
                  onPressed: () => Navigator.pop(context),
                  text: "Keep Vehicle",
                  noIcon: true,
                ),
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () {
                  onDelete();
                  Navigator.pop(context);
                },
                child: CustomText(
                  size: 16.sp,
                  text: "Permanently Delete Vehicle",
                  underline: true,
                  fontFamily: AppFontNames.gillSansBold,
                ),
              ),
            ],
          )),
    );
  }
}
