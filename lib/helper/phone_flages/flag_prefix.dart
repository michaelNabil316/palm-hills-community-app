import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/phone_flages/countries.dart';
import '../../helper/styles.dart';

class FlagPrefix extends StatelessWidget {
  final Country selectedCountry;
  const FlagPrefix({super.key, required this.selectedCountry});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(width: 14.w),
      Text(
        "${selectedCountry.flag} +${selectedCountry.dialCode}",
        style: TextStyle(color: AppColors.secondaryText, fontSize: 16.sp),
      ),
      const Icon(Icons.keyboard_arrow_down, color: AppColors.secondaryText),
      Text(
        "| ",
        style: TextStyle(color: Colors.grey, fontSize: 18.sp),
      ),
    ]);
  }
}
