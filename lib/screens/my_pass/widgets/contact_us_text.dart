import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
    required this.fun,
  });

  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/hint_lamp.svg"),
        SizedBox(
          width: 5.w,
        ),
        CustomText(
          text: "In case you have any issues with the beach pass. ",
          color: Colors.grey,
          size: 12.sp,
        ),
        InkWell(
            onTap: fun,
            child: CustomText(
              text: "Contact Us ",
              color: AppColors.primary,
              size: 12.sp,
              fontFamily: AppFontNames.gillSansBold,
            )),
      ],
    );
  }
}
