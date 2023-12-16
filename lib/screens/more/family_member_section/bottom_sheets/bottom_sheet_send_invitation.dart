import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../shared_components/custom_buttons/button_large.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../controller/family_controller.dart';
import '../widgets/one_line_radio_card.dart';

class SendInvitaionBottomSheet extends StatelessWidget {
  const SendInvitaionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                CustomText(
                  text: "Approve Family Member",
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
          ),
          SizedBox(height: 15.h),
          Container(
            width: double.infinity,
            height: 90.h,
            color: AppColors.whiteSugaer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: "Karim Mohamed",
                  fontFamily: AppFontNames.gillSansBold,
                  size: 16.sp,
                  color: AppColors.secondaryText,
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 20.h,
                    ),
                    SizedBox(width: 5.w),
                    CustomText(
                      text: "sibling",
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 50.w),
                    Icon(
                      Icons.phone_android,
                      size: 20.h,
                    ),
                    SizedBox(width: 5.w),
                    CustomText(
                      text: "+20 100 8402752",
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          GetBuilder<FamilyCtrl>(
            init: FamilyCtrl(),
            builder: (con) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),
                    CustomText(
                      text: "GATE PASSES",
                      fontFamily: AppFontNames.gillSansBold,
                      size: 16.sp,
                      color: AppColors.secondaryText,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: "Manage member's compound gate passes",
                      size: 16.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 24.h),
                    OneLineSwitchRadio(
                      isSelected: con.palmSwitcherSendInv,
                      text: "Palm Hills Katameya",
                      onChanged: (value) {
                        con.changePalmSwitcherSendInv(value);
                      },
                    ),
                    SizedBox(height: 16.h),
                    OneLineSwitchRadio(
                      isSelected: con.hacindaSwitcherSendInv,
                      text: "Hacienda Bay",
                      onChanged: (value) {
                        con.changeHacindaSwitcherSendInv(value);
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomLargeButton(
                      stopBtnActivity: !con.isThereChangeHappened(),
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pop(context);
                      },
                      text: "Send Invitation Code",
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
