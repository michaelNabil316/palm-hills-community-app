import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/my_space/widgets/main_cards/guest_space_card.dart';
import 'package:palm_hills/screens/my_space/widgets/tab_view_my_space.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/shared_components/loader_widget.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../helper/navigation.dart';
import '../../shared_components/custom_buttons/button_large.dart';
import '../../shared_components/two_colored_titles.dart';
import '../../shared_components/guest_view_empty_page.dart';
import 'add_tenant/add_tenant_details_screen.dart';
import 'all_my_units_screen.dart';
import 'controllers/my_space_controller.dart';
import 'widgets/add_gate_icon.dart';
import 'widgets/main_cards/driver_space_card.dart';
import 'widgets/main_cards/family_space_card.dart';
import 'widgets/my_unit_card.dart';
import 'widgets/no_gates_avaliable.dart';

class MySpaceScreen extends StatelessWidget {
  MySpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          userGeneralData != null ? AppColors.secondaryText : Colors.white,
      body: GetBuilder<MySpaceController>(
        init: MySpaceController(),
        builder: (con) {
          return userGeneralData != null
              ? Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Platform.isAndroid ? 180.h : 200.h,
                                ),
                                Row(
                                  children: [
                                    TwoColoredTexts(
                                        txt1: "GATE", txt2: "PASSES"),
                                    Spacer(),
                                    AddGatePlusIcon(),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                TabViewMySpace(),
                                SizedBox(height: 20.h),
                                if (con.uiList.isEmpty) NoGatesAvailable(),
                                Column(
                                  children: con.uiList.map((e) {
                                    return con.selectedIndex == 0
                                        ? GateSpaceCard(passModel: e)
                                        : con.selectedIndex == 1
                                            ? DriverSpaceCard(passModel: e)
                                            : FamilySpaceCard(passModel: e);
                                  }).toList(),
                                ),
                                SizedBox(height: 30.h),
                                Row(
                                  children: [
                                    TwoColoredTexts(
                                        txt1: "MANAGE YOUR", txt2: "UNITS"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100.h,
                                color: Colors.white,
                                child: SizedBox(),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 8.h),
                                        Column(
                                          children: myCompounds
                                              .map(
                                                (e) => Row(
                                                  children: [
                                                    CustomText(
                                                      textAlign:
                                                          TextAlign.start,
                                                      text: "IN ${e.comName}"
                                                          .toUpperCase(),
                                                      size: 14.sp,
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        SizedBox(height: 24.h),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  MyUnitCard(
                                    title: "My Unit",
                                    subTitle: con.myUnitsSubTile(),
                                    onTap: () =>
                                        navigateTo(context, AllMyUnitsScreen()),
                                  ),
                                  SizedBox(height: 16.h),
                                  // MyUnitCard(
                                  //     title: "My Payments",
                                  //     iconName: "walt_payment",
                                  //     subTitle:
                                  //         "Installments, maintenance & service free"),
                                  // SizedBox(height: 16.h),
                                  // MyUnitCard(
                                  //     title: "Services",
                                  //     iconName: "services_heart",
                                  //     subTitle:
                                  //         "House cleaning, car wash, electricity..."),
                                  SizedBox(height: 40.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text:
                                            "Are you currently renting this unit?",
                                        size: 14.sp,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomLargeButton(
                                        primeColor: Colors.white,
                                        backColor: Colors.transparent,
                                        iconColor: Colors.white,
                                        onPressed: () {
                                          navigateTo(
                                              context, AddTenantScreen());
                                        },
                                        text: "Add Tenant"),
                                  ),
                                  SizedBox(height: 100.h),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (con.loadingData) LoadingData(),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GuestViewEmptyPage(
                    subTitle: "Register or Login to view your space",
                    svgPath: "myspace.svg",
                  ),
                );
        },
      ),
    );
  }
}
