import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/repository/home_repository.dart';
import 'package:palm_hills/screens/home/controller/sales_launches_controller.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../../helper/constants.dart';
import '../../../shared_components/cursoler.dart';
import '../../more/reservation/widgets/shimmer_image.dart';
import '../widgets/sales_launches_tab_title.dart';

class SalesLaunchesSection extends StatelessWidget {
  const SalesLaunchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesLaunchesController>(
      init: SalesLaunchesController(),
      builder: (con) {
        return Column(
          children: [
            //list or compounds
            Container(
              height: 30.h,
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: con.salesLaunchesCompoundsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        con.SetTabIndex(index);
                      },
                      child: TabTitle(
                        title: con.salesLaunchesCompoundsList[index],
                        isSelected: con.salesLaunchesSelectedIndex == index,
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 260.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...con
                        .getListOfFilterdSalesLaunches()
                        .map(
                          (e) => Container(
                            width: 1.sw,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: FutureBuilder(
                              future: HomeApi.getSalesLaunchesImage(e.id!),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  if (snapshot.data!.errorFlag == true) {
                                    return Image.asset(
                                      defaultCompoundAssetPath,
                                      width: 340.w,
                                      height: 240.h,
                                      fit: BoxFit.cover,
                                    );
                                  }
                                  if (snapshot.data!.errorFlag == false) {
                                    return Image.memory(
                                      base64Decode(snapshot.data!.values),
                                      width: 340.w,
                                      height: 240.h,
                                      fit: BoxFit.cover,
                                    );
                                  }
                                }
                                return ShimmerImageLoader(
                                    width: 340.w, height: 240.h);
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (con.salesLaunchesList.isNotEmpty)
                    Expanded(
                      child: CustomText(
                        size: 16.sp,
                        textAlign: TextAlign.start,
                        text: con
                                .salesLaunchesList[
                                    con.salesLaunchesSelectedIndex]
                                .description ??
                            "",
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            CustomCarousel(
              count: con.getListOfFilterdSalesLaunches().length,
              selectedIndex: con.selectedCarouselIndex,
            ),
            /*
            //list of images with description for selected compound
            Column(
              children: [
                Container(
                  height: 260.h,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: con.getListOfFilterdSalesLaunches().length,
                    onPageChanged: (index) {
                      con.changeSelectedCarousel(index);
                    },
                    itemBuilder: (context, index) => Container(
                      width: 1.sw,
                      child: Center(
                        child: FutureBuilder(
                          future: HomeApi.getSalesLaunchesImage(
                              con.getListOfFilterdSalesLaunches()[index].id!),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              if (snapshot.data!.errorFlag == true) {
                                return Image.asset(
                                  defaultCompoundAssetPath,
                                  width: 340.w,
                                  height: 240.h,
                                  fit: BoxFit.cover,
                                );
                              }
                              if (snapshot.data!.errorFlag == false) {
                                return Image.memory(
                                  base64Decode(snapshot.data!.values),
                                  width: 340.w,
                                  height: 240.h,
                                  fit: BoxFit.cover,
                                );
                              }
                            }
                            return ShimmerImageLoader(
                                width: 340.w, height: 240.h);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (con.salesLaunchesList.isNotEmpty)
                        Expanded(
                          child: CustomText(
                            size: 16.sp,
                            textAlign: TextAlign.start,
                            text: con
                                    .salesLaunchesList[
                                        con.salesLaunchesSelectedIndex]
                                    .description ??
                                "",
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CustomCarousel(
                  count: con.getListOfFilterdSalesLaunches().length,
                  selectedIndex: con.selectedCarouselIndex,
                ),
              ],
            ),
            */
          ],
        );
      },
    );
  }
}
