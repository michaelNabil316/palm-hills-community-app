import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/constants.dart';
import 'package:palm_hills/models/user_model.dart';
import 'package:palm_hills/screens/more/family_member_section/controller/family_controller.dart';
import '../../../shared_components/custom_app_bars/app_bar_center_image.dart';
import '../../../shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text.dart';
import '../../../shared_components/loader_widget.dart';
import '../../../helper/styles.dart';
import 'bottom_sheets/bottom_sheet_access_rights.dart';
import 'widgets/alert_delete_member.dart';
import 'widgets/double_dashboard_widget.dart';
import 'widgets/one_line_radio_card.dart';

class MemberDetailsScreen extends StatelessWidget {
  final UserModel user;
  const MemberDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FamilyCtrl>(
      init: FamilyCtrl(),
      builder: (con) {
        return Stack(
          children: [
            Scaffold(
              appBar: appBarCenterImage(
                imgPath: defaultProfileUrl,
                onPressBackBtn: () => Navigator.pop(context),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    DoubleDashBoardCard(
                        compound: user.statuscodeODataCommunityValue ?? "",
                        relation: user.relationshipValue ?? ""),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return AccessRightsBottomSheet(
                                  onChangeFun: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          child: CustomText(
                            text: "View Access Rights",
                            color: AppColors.secondaryText,
                            size: 16.sp,
                            underline: true,
                            fontFamily: AppFontNames.gillSansBold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        CustomText(
                          text: "GATE  ",
                          color: AppColors.secondaryText,
                          size: 18.sp,
                          fontFamily: AppFontNames.gillSansBold,
                        ),
                        CustomText(
                          text: "PASSES",
                          color: AppColors.primary,
                          size: 18.sp,
                          fontFamily: AppFontNames.gillSansBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    OneLineSwitchRadio(
                      text: "Palm Hills Katameya",
                      isSelected: con.palmSwitcher,
                      onChanged: (value) {
                        con.changePalmSwitcher(value);
                      },
                    ),
                    SizedBox(height: 16.h),
                    OneLineSwitchRadio(
                      text: "Hacienda Bay",
                      isSelected: con.hacindaSwitcher,
                      onChanged: (value) {
                        con.changeHacindaSwitcher(value);
                      },
                    ),
                    SizedBox(height: 40.h),
                    CustomLargeButton(
                      stopBtnActivity: !con.isThereChangeHappenedInMemberPage(),
                      onPressed: () {},
                      text: "Save Changes",
                      noIcon: true,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext cont) {
                                return DeleteMemberAlert(
                                  deleteFunction: () async {
                                    con.deleteMyFamilyAccount(context, user.id);
                                  },
                                );
                              },
                            );
                          },
                          child: CustomText(
                            text: "Delete Member",
                            fontFamily: AppFontNames.gillSansBold,
                            size: 14.sp,
                            underline: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
            if (con.loadingData) LoadingData(),
          ],
        );
      },
    );
  }
}
