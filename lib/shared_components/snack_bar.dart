import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/styles.dart';
import 'custom_text.dart';

Future<void> showCustomSnackbar({
  required BuildContext context,
  required String message,
  required bool isSuccessBar,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 0.75.sh, left: 20.w, right: 20.w),
      backgroundColor: (isSuccessBar
          ? Color.fromRGBO(237, 250, 239, 1)
          : Color.fromRGBO(255, 235, 235, 1)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
        // side: BorderSide(
        //   color: isSuccessBar
        //       ? AppColors.custometeal
        //       : AppColors.SecondprimaryColorBtn,
        // ),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: isSuccessBar ? AppColors.success : AppColors.primary,
          ),
          SizedBox(width: 15),
          Expanded(
            child: CustomText(
              textAlign: TextAlign.start,
              text: message,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      // showCloseIcon: true,
      // closeIconColor: isSuccessBar ? AppColors.success : AppColors.primary,
    ),
  );
}
