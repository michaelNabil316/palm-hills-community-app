import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../controllers/my_space_controller.dart';

class TabViewMySpace extends StatelessWidget {
  const TabViewMySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySpaceController>(
      init: MySpaceController(),
      builder: (con) {
        int getLenth(index) {
          switch (index) {
            case 0:
              return con.guestList.length;
            case 1:
              return con.driverList.length;
            case 2:
              return con.familyList.length;
          }
          return 0;
        }

        return Container(
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: con.myTabs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  con.changeTab(index);
                },
                child: Container(
                  width: 116.w,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: con.selectedIndex == index
                          ? AppColors.secondaryText
                          : Colors.black12,
                      width: 1.0,
                    )),
                  ),
                  child: CustomText(
                    text:
                        "${con.myTabs[index]} ${getLenth(index) != 0 ? "(${getLenth(index)})" : ""}",
                    fontFamily: con.selectedIndex == index
                        ? AppFontNames.gillSansBold
                        : null,
                    color: con.selectedIndex == index
                        ? AppColors.secondaryText
                        : AppColors.primaryText,
                    size: 16.sp,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
