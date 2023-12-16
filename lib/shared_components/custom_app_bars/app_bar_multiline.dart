import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/styles.dart';
import '../custom_text.dart';

AppBar appBarMultinLine({
  required String title,
  String? subtitle,
  bool? noBackArrow,
  Function()? onPressBackBtn,
}) {
  return AppBar(
    backgroundColor: AppColors.secondaryText,
    toolbarHeight: 95.h,
    leading: const SizedBox(),
    flexibleSpace: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.sh > 1000 ? 10.h : 20.h),
          noBackArrow == true
              ? SizedBox(height: 26.h)
              : InkWell(
                  onTap: onPressBackBtn,
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    child: SvgPicture.asset(
                      "assets/icons/arrow_back.svg",
                      height: 22.h,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
          if (subtitle == null) SizedBox(height: 3.h),
          CustomText(
            text: title,
            color: Colors.white,
            fontFamily: AppFontNames.gillSansBold,
            size: 24.sp,
          ),
          if (subtitle != null)
            CustomText(
              text: subtitle,
              color: Colors.white,
              size: 14.sp,
            ),
          SizedBox(height: 1.h),
        ],
      ),
    ),
  );
}

// class AppBarMultinLine extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final String? subtitle;
//   final bool? noBackArrow;
//   final Function()? noPressBackBtn;
//   const AppBarMultinLine({
//     super.key,
//     required this.title,
//     this.noPressBackBtn,
//     this.noBackArrow,
//     this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.secondaryText,
//       padding: EdgeInsets.symmetric(horizontal: 30.w),
//       height: 170.h,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(width: 10.h),
//           AppBar(
//             title: Column(
//               children: [
//                 noBackArrow == true
//                     ? SizedBox(width: 10.h)
//                     : GestureDetector(
//                         onTap:
//                             noPressBackBtn ?? () => Navigator.of(context).pop(),
//                         child: SvgPicture.asset(
//                           "assets/icons/arrow_back.svg",
//                           color: Colors.white,
//                         ),
//                       ),
//                 SizedBox(width: 10.h),
//                 CustomText(
//                   text: title,
//                   color: Colors.white,
//                   isBold: true,
//                   size: 24.sp,
//                 ),
//               ],
//             ),
//           ),
//           if (subtitle != null)
//             CustomText(
//               text: subtitle!,
//               color: Colors.white,
//               isBold: false,
//             )
//           else
//             SizedBox(height: 50.h),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
