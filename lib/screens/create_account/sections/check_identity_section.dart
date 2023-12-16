import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_buttons/button_listtile.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../controller/create_controller.dart';
import '../create_complete_successfuly.dart';
import '../take_selfie_screen.dart';
import '../widgets/create_account_road_map_item.dart';
// import '../widgets/divider_with_uper_shadow.dart';

class CheckIdentity extends StatelessWidget {
  const CheckIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountCtrl>(
      init: CreateAccountCtrl(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.6.sh,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 42.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CreateAccountRoadMapItem(
                                index: 2, currentIndex: 0, text: "Add details"),
                            if (controller.selectedIndex == 0)
                              CreateAccountRoadMapItem(
                                  index: 2,
                                  currentIndex: 1,
                                  text: "Verfiy Number"),
                            CreateAccountRoadMapItem(
                                index: controller.selectedIndex == 0 ? 2 : 1,
                                currentIndex:
                                    controller.selectedIndex == 0 ? 2 : 1,
                                text: "Check Identity"),
                          ],
                        ),
                        SizedBox(height: 42.h),
                        CustomText(
                          text: "CHECK IDENTITY",
                          fontFamily: AppFontNames.gillSansBold,
                          size: 18.sp,
                        ),
                        SizedBox(height: 12.h),
                        CustomText(
                          text: "A few more steps to set up your account.",
                          size: 16.sp,
                        ),
                        SizedBox(height: 15.h),
                        CustomBtnListTile(
                            title: "Take a Selfie",
                            leadingImgPath: "person_logo.svg",
                            trailingImgPath: "arrow_forward.svg",
                            onPress: () {
                              navigateTo(context, TakeSelfieScreen());
                            }),
                        SizedBox(height: 12.h),
                        if (!controller.isFamilyMemberblewThan15years())
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomBtnListTile(
                                title: "Upload National ID - front",
                                leadingImgPath: "document_logo.svg",
                                trailingImgPath: "upload_arrow_up.svg",
                                onPress: () {},
                              ),
                              SizedBox(height: 5.h),
                              CustomText(
                                text: "PNG, JPG, JPEG. 2 MB Max",
                                color: Colors.grey,
                                size: 12.sp,
                              ),
                            ],
                          ),
                        if (controller.selectedIndex == 1)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomBtnListTile(
                                title: "Upload National ID - Back",
                                leadingImgPath: "document_logo.svg",
                                trailingImgPath: "upload_arrow_up.svg",
                                onPress: () {},
                              ),
                              SizedBox(height: 5.h),
                              CustomText(
                                text: "PNG, JPG, JPEG. 2 MB Max",
                                color: Colors.grey,
                                size: 12.sp,
                              ),
                            ],
                          ),
                        //============================================== if it is family member
                        if (controller.selectedIndex == 2)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12.h),
                              CustomBtnListTile(
                                title: "Upload Birth Certificate",
                                leadingImgPath: "document_logo.svg",
                                trailingImgPath: "upload_arrow_up.svg",
                                onPress: () {},
                              ),
                              SizedBox(height: 5.h),
                              CustomText(
                                text: "PNG, JPG, JPEG. 2 MB Max",
                                color: Colors.grey,
                                size: 12.sp,
                              ),
                              SizedBox(height: 12.h),
                              if (controller.selectedRelationIndex == 0)
                                CustomBtnListTile(
                                  title: "Upload Marriage Certificate",
                                  leadingImgPath: "document_logo.svg",
                                  trailingImgPath: "upload_arrow_up.svg",
                                  onPress: () {},
                                ),
                              if (controller.selectedRelationIndex == 0)
                                SizedBox(height: 5.h),
                              if (controller.selectedRelationIndex == 0)
                                CustomText(
                                  text: "PNG, JPG, JPEG. 2 MB Max",
                                  color: Colors.grey,
                                  size: 12.sp,
                                ),
                              //SizedBox(height: 10.h),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                //DividerWithUperShadow(),
                //SizedBox(height: 20.h),

                //SizedBox(height: 15.h),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 145.h,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, -3),
              ),
            ]),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Center(
                  child: CustomText(
                      text:
                          "By creating an account, you agree to Palm Hills Community",
                      size: 14.sp),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Privacy Policy",
                      size: 14.sp,
                      color: AppColors.primary,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                    CustomText(text: " & ", size: 14.sp),
                    CustomText(
                      text: "Terms of Use",
                      size: 14.sp,
                      color: AppColors.primary,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: controller.pressBack,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 31.r,
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            "assets/icons/arrow_back.svg",
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomLargeButton(
                        text: "Submit & Create Account",
                        onPressed: () {
                          navigateTo(context, CreateCompleteSuccessfuly());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
