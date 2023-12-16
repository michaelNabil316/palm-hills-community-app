import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../../helper/navigation.dart';
import '../add_new_member_screen.dart';

class NoFamilyMembers extends StatelessWidget {
  const NoFamilyMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.h),
        SvgPicture.asset(
          "assets/icons/my_family.svg",
          width: 40.w,
          height: 40.w,
          color: AppColors.secondaryText,
        ),
        SizedBox(height: 18.h),
        CustomText(
          text: "No family members added yet.",
          size: 20.sp,
          fontFamily: AppFontNames.gillSansBold,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "you haven't added any family member to this compound.",
            ),
          ],
        ),
        SizedBox(height: 40.h),
        CustomLargeButton(
            onPressed: () {
              navigateTo(context, AddNewMemberScreen());
            },
            text: "Add a New Member")
      ],
    );
  }
}
