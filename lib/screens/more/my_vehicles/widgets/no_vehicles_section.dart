import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import 'add_vehicle_bottom_sheet.dart';

class NoVehiclesSection extends StatelessWidget {
  const NoVehiclesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 180.h),
        SvgPicture.asset(
          "assets/icons/car.svg",
          width: 40.w,
          height: 40.w,
          color: AppColors.secondaryText,
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "No Registered Vehicles!",
              size: 20.sp,
              fontFamily: AppFontNames.gillSansBold,
            ),
          ],
        ),
        SizedBox(height: 40.h),
        CustomLargeButton(
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return AddVehicleBottomSheet();
                },
              );
            },
            text: "Add Your First Vehicle")
      ],
    );
  }
}
