import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/my_space/model/unit_model.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/shared_components/divider_vertical.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line.dart';
import 'add_tenant/add_tenant_details_screen.dart';
import 'widgets/document_download_card.dart';

class UnitDetailsScreen extends StatelessWidget {
  final UnitModel unit;
  const UnitDetailsScreen({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLine(
        title: "UNIT DETAILS",
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            CustomText(
              text: unit.comName ?? "",
              fontFamily: AppFontNames.gillSansBold,
              size: 20.sp,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30),
              color: AppColors.whiteSugaer,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 14.h),
                        SvgPicture.asset("assets/icons/location_glass.svg"),
                        SizedBox(height: 6.h),
                        CustomText(
                          text: unit.relatedunitPlace ?? "",
                          size: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                  CustomVerticalDivider(
                    height: 80.h,
                    marginHorizontal: 30.w,
                    color: Colors.black12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 14.h),
                        SvgPicture.asset("assets/icons/person_logo.svg"),
                        SizedBox(height: 10.h),
                        CustomText(
                          text: "Owner",
                          size: 14.sp,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              children: [
                CustomText(
                  text: "UNIT  ",
                  color: AppColors.secondaryText,
                  size: 18.sp,
                  fontFamily: AppFontNames.gillSansBold,
                ),
                CustomText(
                  text: "DOCUMENT",
                  color: AppColors.primary,
                  size: 18.sp,
                  fontFamily: AppFontNames.gillSansBold,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            DocumentDownloadCard(text: "Owner's Manual"),
            SizedBox(height: 16.h),
            DocumentDownloadCard(text: "Project Policy"),
            SizedBox(height: 16.h),
            DocumentDownloadCard(text: "Architecture Manual"),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: "Are you currently renting this unit?", size: 14.sp)
              ],
            ),
            SizedBox(height: 16.h),
            CustomLargeButton(
                onPressed: () {
                  Get.to(() => AddTenantScreen());
                },
                text: "Add Tenant"),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
