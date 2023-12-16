import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared_components/custom_buttons/button_small.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../bottom_sheets/bottom_sheet_send_invitation.dart';

class MemberRequestCard extends StatelessWidget {
  const MemberRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          CustomText(
            text: "Karim Mohamed",
            size: 16.sp,
            fontFamily: AppFontNames.gillSansBold,
          ),
          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/person_logo.svg"),
              SizedBox(width: 10.w),
              CustomText(
                text: "Sibling",
                size: 16.sp,
                color: Colors.grey,
              ),
              SizedBox(width: 15.w),
              SvgPicture.asset("assets/icons/phone_icon.svg"),
              SizedBox(width: 10.w),
              CustomText(
                text: "+20 100 456789",
                size: 16.sp,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              CircleAvatar(
                radius: 21.r,
                backgroundColor: AppColors.primary,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: CustomSmallButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SendInvitaionBottomSheet();
                      },
                    );
                  },
                  text: "Approve",
                  noIcon: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
