import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.ImagePath,
    required this.fun,
    required this.Text,
    super.key,
  });

  final VoidCallback fun;
  final String Text, ImagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        width: 160.w,
        height: 100.h,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            color: Colors.white),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 35.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.13),
              ),
              child: Center(
                child: SvgPicture.asset(
                  ImagePath,
                  width: 35.w,
                  height: 20.h,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: Text,
              size: 16.sp,
              color: AppColors.secondaryText,
            )
          ],
        )),
      ),
    );
  }
}
