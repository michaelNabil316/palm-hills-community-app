import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../../shared_components/custom_text.dart';
import '../../../shared_components/loader_widget.dart';
import '../../../shared_components/two_colored_titles.dart';
import '../../../helper/styles.dart';
import '../../home/main_page_bottom_nav.dart';
import '../../home/sections/custom_bottom_nav.dart';
import '../../home/sections/floating_action_button.dart';
import 'add_new_member_screen.dart';
import 'controller/family_controller.dart';
import 'widgets/family_member_card.dart';
import 'widgets/no_family_members.dart';
import 'widgets/request_card.dart';

class FamilyMemberScreen extends StatelessWidget {
  const FamilyMemberScreen({super.key});

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
      appBar: appBarOneLineWithIcon(
        title: "Family Member",
        onPressPluskBtn: () {
          navigateTo(context, AddNewMemberScreen());
        },
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: GetBuilder<FamilyCtrl>(
          init: FamilyCtrl(),
          builder: (con) {
            return con.loadingData
                ? LoadingData()
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          if (con.requests.isNotEmpty)
                            Row(
                              children: [
                                CustomText(
                                  text: "PENDING ",
                                  size: 18.sp,
                                  fontFamily: AppFontNames.gillSansBold,
                                ),
                                CustomText(
                                  text: "REQUESTS",
                                  color: AppColors.primary,
                                  size: 18.sp,
                                  fontFamily: AppFontNames.gillSansBold,
                                ),
                              ],
                            ),
                          if (con.requests.isNotEmpty) SizedBox(height: 20.h),
                          if (con.requests.isNotEmpty)
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) => MemberRequestCard(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.h),
                              itemCount: con.requests.length,
                            ),
                          SizedBox(height: 10.h),
                          if (con.members.isNotEmpty)
                            Row(
                              children: [
                                TwoColoredTexts(txt1: "All", txt2: "MEMBERS")
                              ],
                            ),
                          if (con.members.isEmpty) NoFamilyMembers(),
                          SizedBox(height: 20.h),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) => FamilyMemberCard(
                              user: con.members[i],
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 15.h),
                            itemCount: con.members.length,
                          ),
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
