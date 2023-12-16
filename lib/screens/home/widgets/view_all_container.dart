import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class ViewAllContainer extends StatelessWidget {
  const ViewAllContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250.h,
          width: 100.w,
          margin: EdgeInsets.only(right: 20.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: CustomText(
            text: "View All",
            color: AppColors.primary,
            fontFamily: AppFontNames.gillSansBold,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
