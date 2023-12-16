import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/screens/my_space/generate_new_pass.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_text.dart';

class NoGatesAvailable extends StatelessWidget {
  const NoGatesAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        SvgPicture.asset("assets/icons/gate_pass.svg"),
        SizedBox(height: 16.h),
        CustomText(
          text: "No passes generated yet.",
          isBold: true,
          size: 18.sp,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: "You haven't generated any passes.",
        ),
        SizedBox(height: 40.h),
        CustomLargeButton(
          onPressed: () {
            navigateTo(context, GenerateNewPassScreen());
          },
          text: "Generate a New Pass",
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
