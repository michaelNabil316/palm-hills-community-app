import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/cash_helper/shared_pref.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/screens/login/login_screen.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline_with_image.dart';
import 'choose_your_neighbour/choose_your_neighbour_screen.dart';
import 'family_member_section/family_member_screen.dart';
import 'family_member_section/widgets/category_card.dart';
import 'family_member_section/widgets/more_card.dart';
import 'my_vehicles/my_vehicles_screen.dart';
import 'reservation/all_reservation_screen.dart';
import 'sales_inquiry/sales_inquiry_screen.dart';
import 'send_us_msg/send_us_msg_screen.dart';
import 'setting_section/setting_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          userGeneralData != null ? AppColors.secondaryText : Colors.white,
      appBar: multilineWithImageAppBar(
          context: context,
          title: userGeneralData?.name,
          owner: userGeneralData != null ? "Owner" : null,
          onTapProfileImg: null),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: 1.sh * 0.8,
              color: Colors.white,
              child: SizedBox(),
            ),
            Column(
              children: [
                SizedBox(height: 60.h),
                if (userGeneralData != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryWidget(
                          ImagePath: "assets/icons/my_family.svg",
                          Text: "My Family",
                          fun: () {
                            navigateTo(context, FamilyMemberScreen());
                          },
                        ),
                        CategoryWidget(
                          ImagePath: "assets/icons/car.svg",
                          Text: "My Vehicles",
                          fun: () {
                            navigateTo(context, VehiclesScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                if (userGeneralData != null) SizedBox(height: 18.h),
                if (userGeneralData != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryWidget(
                          ImagePath: "assets/icons/my_reservation.svg",
                          Text: "My Reservation",
                          fun: () {
                            navigateTo(context, AllReservationScreen());
                          },
                        ),
                        SizedBox(width: 160.w),
                      ],
                    ),
                  ),
                SizedBox(height: 30.h),
                MoreCard(
                  subTitle:
                      "Profile & Account and App Settings to manage and customize your information",
                  title: "Account & Settings ",
                  IconPath: "assets/icons/account.svg",
                  fun: () {
                    navigateTo(context, SettingScreen());
                  },
                ),
                SizedBox(height: 10.h),
                MoreCard(
                  subTitle:
                      "If you are interested in buying or rentinga property with Palm Hills",
                  title: "Sales Inquiry ",
                  IconPath: "assets/icons/sales.svg",
                  fun: () {
                    navigateTo(context, SalesInquiryScreen());
                  },
                ),
                if (userGeneralData != null) SizedBox(height: 10.h),
                if (userGeneralData != null)
                  MoreCard(
                    subTitle:
                        "If you know someone interested in buying or renting a property with Palm Hills",
                    title: "Choose Your Neighbour ",
                    IconPath: "assets/icons/neighbour.svg",
                    fun: () {
                      navigateTo(context, ChooseYourNeighbourScreen());
                    },
                  ),
                SizedBox(height: 10.h),
                MoreCard(
                  subTitle:
                      "In case you have suggestions, complaints, or general inquiries",
                  title: "Send Us a Message ",
                  IconPath: "assets/icons/send_message.svg",
                  fun: () {
                    navigateTo(context, SendUsMsgScreen());
                  },
                ),
                SizedBox(height: 20.h),
                if (userGeneralData != null)
                  InkWell(
                    onTap: () {
                      userGeneralData = null;
                      myCompounds = [];
                      CacheHelper.signOut();
                      navigateAndFinish(context, LoginScreen());
                    },
                    child: CustomText(
                      text: "Log Out",
                      color: Colors.white,
                      fontFamily: AppFontNames.gillSansBold,
                      size: 14.sp,
                    ),
                  ),
                SizedBox(height: 140.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
