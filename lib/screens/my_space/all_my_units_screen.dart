import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/create_account/widgets/bottom_hint.dart';
import 'package:palm_hills/screens/my_space/widgets/my_unit_card.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../helper/navigation.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line.dart';
import '../../shared_components/loader_widget.dart';
import '../home/main_page_bottom_nav.dart';
import '../home/sections/custom_bottom_nav.dart';
import '../home/sections/floating_action_button.dart';
import '../switch_community/bottom_sheet_switch_commuinty.dart';
import 'controllers/my_space_controller.dart';
import 'unit_details_screen.dart';

class AllMyUnitsScreen extends StatefulWidget {
  AllMyUnitsScreen({super.key});

  @override
  State<AllMyUnitsScreen> createState() => _AllMyUnitsScreenState();
}

class _AllMyUnitsScreenState extends State<AllMyUnitsScreen> {
  final con = Get.put(MySpaceController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButoonCustomization(),
      bottomNavigationBar: CustomBottomNav(
        onTapFromSubScreen: () {
          navigateAndFinish(context, MainPageBottomNav());
        },
      ),
      appBar: appBarOneLine(
        title: "MY UNITS",
        onPressBackBtn: () => Navigator.pop(context),
        // onPressPluskBtn: () {
        // showModalBottomSheet<void>(
        //   isScrollControlled: true,
        //   context: context,
        //   builder: (BuildContext context) {
        //
        //   },
        // );
        // },
      ),
      body: SingleChildScrollView(
        child: GetBuilder<MySpaceController>(builder: (_) {
          if (con.loadingData)
            return Container(
              margin: EdgeInsets.only(top: 0.35.sh),
              child: LoadingData(),
            );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MyUnitCard(
                      title: con.myUnits[index].comName ?? "owner",
                      subTitle: con.myUnits[index].compound ?? "location",
                      noForwardOcon: false, // is it my unit or my family unit
                      onTap: () {
                        con.selectedUnitName = con.myUnits[index].comName ?? "";
                        navigateTo(
                          context,
                          UnitDetailsScreen(unit: con.myUnits[index]),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: con.myUnits.length),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BottomHint(
                    text: "You are currently viewing units in "
                        "Palm Hills Katameya,to view "),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  SizedBox(width: 40.w),
                  CustomText(
                    text: "units in other compounds  ",
                    color: Colors.grey,
                    size: 12.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SwitchCommunityBottomSheet();
                        },
                      );
                    },
                    child: CustomText(
                      text: "Switch Compound",
                      color: AppColors.primary,
                      fontFamily: AppFontNames.gillSansBold,
                      size: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
