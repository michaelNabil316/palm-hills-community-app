import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared_components/custom_buttons/button_large.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';

class AccessRightsBottomSheet extends StatelessWidget {
  final Function() onChangeFun;
  const AccessRightsBottomSheet({
    super.key,
    required this.onChangeFun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: 300.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
            text: "ACCESS RIGHTS",
            fontFamily: AppFontNames.gillSansBold,
            size: 18.sp,
            color: AppColors.secondaryText,
          ),
          SizedBox(height: 30.h),
          CustomText(
            text: "For the added compounds",
            fontFamily: AppFontNames.gillSansBold,
            size: 14.sp,
            color: AppColors.secondaryText,
          ),
          SizedBox(height: 15.h),
          BottomSheetRow(
              ICON: Icons.check,
              Title: "Generate guests' gate and beach passes",
              isTrue: true),
          SizedBox(height: 10.h),
          BottomSheetRow(
              ICON: Icons.check,
              Title: "Generate driver/help gate passes",
              isTrue: true),
          SizedBox(height: 10.h),
          BottomSheetRow(
              ICON: Icons.close, Title: "View unit details", isTrue: false),
          SizedBox(height: 45.h),
          CustomLargeButton(
            noIcon: true,
            onPressed: onChangeFun,
            text: "Done",
          ) // add no icon attribute
        ],
      ),
    );
  }
}

class BottomSheetRow extends StatelessWidget {
  const BottomSheetRow({
    required this.Title,
    required this.ICON,
    required this.isTrue,
    super.key,
  });

  final String Title;
  final IconData ICON;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          ICON,
          size: 20.h,
          color: isTrue ? Colors.green : AppColors.primary,
        ),
        SizedBox(width: 10.w),
        CustomText(
          text: Title,
          size: 16.sp,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}
