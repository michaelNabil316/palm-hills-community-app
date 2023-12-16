import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/community/controller/controller.dart';
import 'package:palm_hills/shared_components/guest_view_empty_page.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/loader_widget.dart';
import 'widgets/announce_card.dart';
import 'widgets/no_announcements.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityCtrl>(
        init: CommunityCtrl(),
        builder: (con) {
          if (userGeneralData == null)
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GuestViewEmptyPage(
                  subTitle: "Register or Login to view your community",
                  svgPath: "community.svg"),
            );
          if (con.loadingData) return LoadingData();
          if (con.announcements.isEmpty) return NoAnnouncements();
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Platform.isAndroid ? 180.h : 210.h),
                    CustomText(
                      text: "ANNOUNCEMENT",
                      size: 18.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                    SizedBox(height: 24),
                    ...con.announcements
                        .map(
                          (e) => AnnounceCard(announcement: e),
                        )
                        .toList(),
                    SizedBox(height: 100.h),
                  ],
                )),
            // ),
          );
        });
  }
}
