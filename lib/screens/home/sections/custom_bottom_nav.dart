import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/home/controller/home_controller.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/top_colored_line_nav_bar.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({
    super.key,
    this.onTapFromSubScreen,
    this.isSubScreen,
  });
  final Function()? onTapFromSubScreen;
  final bool? isSubScreen;
  final con = Get.put(HomeController(), permanent: true);
  onTapFromSub() {
    if (onTapFromSubScreen != null) {
      onTapFromSubScreen!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        //  init: HomeController(),
        builder: (con) {
      return CustomPaint(
        size: Size(1.sw, 60.h),
        painter: CustomShapePainter(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.white.withOpacity(0.15),
            //     spreadRadius: 0.1,
            //     blurRadius: 5,
            //     offset: Offset(0, -10),
            //   ),
            // ],
          ),
          height: Platform.isAndroid ? 70.h : 80.h,
          //padding: EdgeInsets.only(top: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  con.setCurrentTab(0);
                  onTapFromSub();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (con.currentTab == 0 && isSubScreen != true)
                      TopColoredLineInNavBar()
                    else
                      SizedBox(height: 8.h),
                    if (con.currentTab == 0 && isSubScreen != true)
                      SvgPicture.asset("assets/icons/hills.svg",
                          width: 30, height: 30)
                    else
                      SvgPicture.asset("assets/icons/un_hills.svg",
                          width: 30, height: 30),
                    CustomText(
                      text: "Hills Today",
                      color: isSubScreen == true
                          ? AppColors.secondaryText
                          : con.currentTab == 0
                              ? AppColors.primary
                              : AppColors.secondaryText,
                      size: 12.sp,
                      fontFamily: con.currentTab == 0 && isSubScreen != true
                          ? AppFontNames.gillSansBold
                          : null,
                    )
                  ],
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.only(right: 9.w, left: 9.w),
                minWidth: 40,
                onPressed: () {
                  con.setCurrentTab(1);
                  onTapFromSub();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (con.currentTab == 1 && isSubScreen != true)
                      TopColoredLineInNavBar()
                    else
                      SizedBox(height: 8.h),
                    if (con.currentTab == 1 && isSubScreen != true)
                      SvgPicture.asset("assets/icons/myspace.svg",
                          width: 30, height: 30)
                    else
                      SvgPicture.asset(
                        "assets/icons/un_myspace.svg",
                        width: 30,
                        height: 30,
                      ),
                    CustomText(
                      text: "My Space",
                      color: isSubScreen == true
                          ? AppColors.secondaryText
                          : con.currentTab == 1 && isSubScreen != true
                              ? AppColors.primary
                              : AppColors.secondaryText,
                      size: 12.sp,
                      fontFamily: con.currentTab == 1 && isSubScreen != true
                          ? AppFontNames.gillSansBold
                          : null,
                    )
                  ],
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.only(right: 9.w, left: 9.w),
                minWidth: 40,
                onPressed: () {
                  con.setCurrentTab(2);
                  onTapFromSub();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (con.currentTab == 2 && isSubScreen != true)
                      TopColoredLineInNavBar()
                    else
                      SizedBox(height: 8.h),
                    if (con.currentTab == 2 && isSubScreen != true)
                      SvgPicture.asset("assets/icons/community.svg",
                          width: 30, height: 30)
                    else
                      SvgPicture.asset(
                        "assets/icons/un_community.svg",
                        width: 30,
                        height: 30,
                      ),
                    CustomText(
                      text: "Community",
                      color: isSubScreen == true
                          ? AppColors.secondaryText
                          : con.currentTab == 2 && isSubScreen != true
                              ? AppColors.primary
                              : AppColors.secondaryText,
                      size: 12.sp,
                      fontFamily: con.currentTab == 2 && isSubScreen != true
                          ? AppFontNames.gillSansBold
                          : null,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                //     padding: EdgeInsets.only(right: 10),
                minWidth: 40,
                onPressed: () {
                  con.setCurrentTab(3);
                  onTapFromSub();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (con.currentTab == 3 && isSubScreen != true)
                      TopColoredLineInNavBar()
                    else
                      SizedBox(height: 8.h),
                    if (con.currentTab == 3 && isSubScreen != true)
                      SvgPicture.asset("assets/icons/more.svg",
                          width: 30, height: 30)
                    else
                      SvgPicture.asset("assets/icons/un_more.svg",
                          width: 30, height: 30),
                    CustomText(
                      text: "More",
                      color: isSubScreen == true
                          ? AppColors.secondaryText
                          : con.currentTab == 3
                              ? AppColors.primary
                              : AppColors.secondaryText,
                      size: 12.sp,
                      fontFamily: con.currentTab == 3 && isSubScreen != true
                          ? AppFontNames.gillSansBold
                          : null,
                    )
                  ],
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      );
    });
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width - 99.w, 0)
      ..lineTo(size.width - 62.5.w, 39.h)
      ..lineTo(size.width - 26.w, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    final path2 = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width - 100.w, 0)
      ..lineTo(size.width - 63.w, 37.h)
      ..lineTo(size.width - 26.w, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(Platform.isAndroid ? path : path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // In this case, we don't need to repaint.
  }
}
