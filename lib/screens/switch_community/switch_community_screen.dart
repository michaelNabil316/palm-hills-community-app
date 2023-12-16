import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import 'controller/switch_community_controller.dart';
import 'widgets/community_item.dart';

class SwitchCommunityScreen extends StatelessWidget {
  const SwitchCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchCommunityCtrl>(
        init: SwitchCommunityCtrl(),
        builder: (controller) {
          return Scaffold(
            appBar: appBarMultinLine(
              title: "WELCOME, INITIUM",
              onPressBackBtn: () => Navigator.of(context).pop(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  CustomText(text: "You're part of more than one community!"),
                  SizedBox(height: 12.h),
                  CustomText(
                    text: "Which one would you like to dive into first?",
                    fontFamily: AppFontNames.gillSansBold,
                    size: 14.sp,
                  ),
                  SizedBox(height: 12.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myCompounds.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.changeSelectedCommunity(index);
                      },
                      child: CommunityItem(
                        title: myCompounds[index].comName ?? "compound",
                        // imgPath: controller.communitiesData[index]["img_path"]!,
                        imgPath: "community_2.png",
                        isSelected: controller.selectedIndex == index,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Center(
                    child: CustomText(
                      text:
                          "You can always switch compounds from within the app.",
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 42.h),
                  CustomLargeButton(
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 2));
                      },
                      text: "Let's Go")
                ],
              ),
            ),
          );
        });
  }
}
