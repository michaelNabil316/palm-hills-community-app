import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared_components/custom_text.dart';
import '../../../shared_components/two_colored_titles.dart';
import '../../../helper/styles.dart';
import '../controller/home_controller.dart';

class NewsAndEvents extends StatelessWidget {
  const NewsAndEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (con) {
        return Row(
          children: [
            SizedBox(width: 20.w),
            TwoColoredTexts(txt1: "NEWS &", txt2: "EVENTS"),
            Spacer(),
            InkWell(
              onTap: () {
                con.SetAction("News");
              },
              child: Container(
                alignment: Alignment.center,
                width: 68.w,
                height: 34.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: con.action == "News"
                          ? AppColors.secondaryText
                          : Colors.grey, // Set the border color here
                      width: 1.0, // Set the border width as needed
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: con.action == "News"
                        ? AppColors.secondaryText
                        : Colors.white),
                child: CustomText(
                    size: 14.sp,
                    text: "News",
                    color: con.action == "News" ? Colors.white : Colors.grey,
                    fontFamily: con.action == "News"
                        ? AppFontNames.gillSansBold
                        : null),
              ),
            ),
            InkWell(
              onTap: () {
                con.SetAction("Events");
              },
              child: Container(
                alignment: Alignment.center,
                width: 68.w,
                height: 34.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: con.action == "Events"
                          ? AppColors.secondaryText
                          : Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: con.action == "Events"
                        ? AppColors.secondaryText
                        : Colors.white),
                child: CustomText(
                  size: 14.sp,
                  text: "Events",
                  color: con.action == "Events" ? Colors.white : Colors.grey,
                  fontFamily:
                      con.action == "Events" ? AppFontNames.gillSansBold : null,
                ),
              ),
            ),
            SizedBox(width: 20.w)
          ],
        );
      },
    );
  }
}
