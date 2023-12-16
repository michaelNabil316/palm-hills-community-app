import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/home/sections/custom_bottom_nav.dart';
import 'package:palm_hills/screens/my_pass/sections/gate_beach.dart';
import 'package:palm_hills/screens/my_pass/widgets/active_button.dart';
import 'package:palm_hills/screens/my_pass/widgets/contact_us_text.dart';
import 'package:palm_hills/screens/my_pass/widgets/done_button.dart';
import '../../helper/navigation.dart';
import '../../shared_components/custom_text.dart';
import '../../helper/styles.dart';
import '../home/main_page_bottom_nav.dart';
import '../home/sections/floating_action_button.dart';
import '../../shared_components/custom_app_bars/home_app_bar.dart';
import '../more/send_us_msg/send_us_msg_screen.dart';

class QRScanningResult extends StatelessWidget {
  const QRScanningResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButoonCustomization(),
      bottomNavigationBar: CustomBottomNav(
        isSubScreen: true,
        onTapFromSubScreen: () {
          navigateAndFinish(context, MainPageBottomNav());
        },
      ),
      appBar: homeAppBar(context: context, noBackArrow: true),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 80.h),
        GateAndBeach(),
        SizedBox(
          height: 30.h,
        ),
        Image.asset(
          "assets/images/qr1.png",
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomText(
          text: "Tarek Mohamed",
          size: 18.sp,
          fontFamily: AppFontNames.gillSansBold,
          color: AppColors.secondaryText,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomText(
          text: "OWNER",
          size: 14.sp,
          color: AppColors.secondaryText,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomText(
          text: "Beach Pass . Hacienda Bay",
          size: 14.sp,
          color: AppColors.primary,
        ),
        SizedBox(
          height: 20.h,
        ),
        ActiveButton(),
        SizedBox(height: 30.h),
        DoneButton(
          fun: () {},
          text: "Done",
          icon: Icons.check_circle_outline,
        ),
        SizedBox(
          height: 15.h,
        ),
        ContactUs(
          fun: () => Get.to(() => SendUsMsgScreen()),
        )
      ])),
    );
  }
}
