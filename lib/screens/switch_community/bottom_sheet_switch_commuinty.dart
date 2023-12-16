import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/create_account/widgets/bottom_hint.dart';
import 'package:palm_hills/screens/switch_community/bottom_sheet_request_addition.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import 'controller/switch_community_controller.dart';
import 'widgets/community_item.dart';
import 'widgets/community_item_sub_details.dart';

class SwitchCommunityBottomSheet extends StatelessWidget {
  const SwitchCommunityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchCommunityCtrl>(
      init: SwitchCommunityCtrl(),
      builder: (controller) {
        return Container(
          height: 0.54.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  CustomText(
                    text: "SWITCH COMPOUND",
                    size: 18.sp,
                    fontFamily: AppFontNames.gillSansBold,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/close_icon.svg",
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myCompounds.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    controller.changeSelectedCommunityBottomSheetIndex(index);
                  },
                  child: CommunityItem(
                    title: myCompounds[index].comName ?? "compound",
                    //imgPath: appCompoudnds[index]["img_path"]!,
                    imgPath: "community_2.png",
                    isSelected: controller.selectedCommunityIndex == index,
                    SubWidget:
                        CommunityItemSubDetails(owner: "Owner", units: 1),
                  ),
                ),
              ),
              SizedBox(height: Platform.isIOS ? 5.h : 30.h),
              CustomLargeButton(
                  onPressed: () {
                    controller.changeSelectedCommunityBottomSheet();
                    Navigator.pop(context);
                  },
                  text: "Select Compound"),
              SizedBox(height: 10.h),
              BottomHint(text: "Can't find a community you're a part of?"),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return RequestAdditionBottomSheet();
                    },
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    CustomText(
                      text: "Request addition to another community",
                      color: AppColors.primary,
                      fontFamily: AppFontNames.gillSansBold,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
