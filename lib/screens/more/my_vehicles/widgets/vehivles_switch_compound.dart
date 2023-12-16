import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helper/styles.dart';
import '../../../switch_community/bottom_sheet_switch_commuinty.dart';

class VehicleSwitchCompound extends StatelessWidget {
  const VehicleSwitchCompound({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/icons/hint_lamp.svg"),
        SizedBox(width: 5.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "You are currently viewing vehicles in Palm Hills Katameya, to view vehicles in other compounds. ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontFamily: AppFontNames.gillSansMedium),
                ),
                TextSpan(
                  text: "Switch Compound",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SwitchCommunityBottomSheet();
                        },
                      );
                    },
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontFamily: AppFontNames.gillSansBold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
