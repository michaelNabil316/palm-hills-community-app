import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/create_account/widgets/bottom_hint.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_app_bars/app_bar_multiline_with_image.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../../shared_components/custom_text_form_field.dart';
import '../../change_password/change_password_screen.dart';
import '../../home/main_page_bottom_nav.dart';
import '../../home/sections/custom_bottom_nav.dart';
import '../../home/sections/floating_action_button.dart';
import '../../user_data.dart';
import '../send_us_msg/send_us_msg_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "PROFILE & ACCOUNT",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButoonCustomization(),
      bottomNavigationBar: CustomBottomNav(
        onTapFromSubScreen: () {
          navigateAndFinish(context, MainPageBottomNav());
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 35.h),
            Center(
              child: RhombusImage(
                imagePath: "https://images.megapixl.com/4684/46846371.jpg",
                rhombusSize: 120.h,
              ),
            ),
            SizedBox(height: 35.h),
            CustomTextFormField(
              label: "Name*",
              textInputType: TextInputType.text,
              controller:
                  TextEditingController(text: userGeneralData!.name ?? ""),
              readOnly: true,
              fillColor: AppColors.whiteSugaer,
            ),
            SizedBox(height: 16.h),
            CustomTextFormField(
              label: "Mobile number*",
              textInputType: TextInputType.text,
              controller: TextEditingController(
                  text: userGeneralData!.mobilenumber ?? ""),
              readOnly: true,
              fillColor: AppColors.whiteSugaer,
            ),
            SizedBox(height: 16.h),
            CustomTextFormField(
              label: "Email*",
              textInputType: TextInputType.text,
              controller:
                  TextEditingController(text: userGeneralData!.email ?? ""),
              readOnly: true,
              fillColor: AppColors.whiteSugaer,
            ),
            SizedBox(height: 16.h),
            CustomTextFormField(
              label: "Password*",
              textInputType: TextInputType.text,
              controller: TextEditingController(text: "000000000"),
              readOnly: true,
              isPassword: true,
              fillColor: AppColors.whiteSugaer,
              suffix: GestureDetector(
                onTap: () => Get.to(() => ChangePasswordScreen()),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.edit_square,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            BottomHint(
              text: "If you want to update your Name, Mobile Number, or Email",
            ),
            Row(
              children: [
                SizedBox(width: 20.w),
                InkWell(
                  onTap: () {
                    Get.to(() => SendUsMsgScreen());
                  },
                  child: CustomText(
                    text: "Contact Us",
                    size: 12.sp,
                    color: AppColors.primary,
                    fontFamily: AppFontNames.gillSansBold,
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomText(
              text: "Delete My Account",
              size: 16.sp,
              underline: true,
              fontFamily: AppFontNames.gillSansBold,
            ),
            SizedBox(height: 110.h),
            // RichText(
            //   text: TextSpan(
            //     text: 'This will  ',
            //     style: TextStyle(
            //       color: AppColors.secondaryText,
            //       fontFamily: AppFontNames.gillSans,
            //       fontSize: 14.sp,
            //     ),
            //     children: const <TextSpan>[
            //       TextSpan(
            //           text: 'permanently',
            //           style: TextStyle(fontFamily: AppFontNames.gillSansBold)),
            //       TextSpan(
            //           text: '  delete all the data related to your account.'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
