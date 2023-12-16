import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/helper/constants.dart';
import 'package:palm_hills/models/user_model.dart';
import '../../../../helper/navigation.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../member_details_screen.dart';

class FamilyMemberCard extends StatelessWidget {
  final UserModel user;
  const FamilyMemberCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          MemberDetailsScreen(user: user),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Image.network(
              defaultProfileUrl,
              width: 54.h,
              height: 54.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: user.name ?? "",
                      size: 16.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                    Spacer(),
                    CustomText(
                      text: user.relationshipValue ?? "",
                      color: Colors.grey,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
            SvgPicture.asset("assets/icons/arrow_forward.svg"),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
