import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/screens/events/model/event_model.dart';
import '../../../../helper/constants.dart';
import '../../../../repository/event_repository.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import 'shimmer_image.dart';

class ReservationCard extends StatelessWidget {
  final EventModel event;
  final Function()? onTap;
  const ReservationCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.3,
              color: Colors.grey,
            )),
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: EventApi.getEventImage(event.id!, true),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.data!.errorFlag == true) {
                    return Image.network(
                      defaultCompoundUrl,
                      width: 340.w,
                      height: 160.h,
                      fit: BoxFit.cover,
                    );
                  }
                  return Image.memory(
                    base64Decode(snapshot.data!.values),
                    width: 340.w,
                    height: 160.h,
                    fit: BoxFit.cover,
                  );
                }
                return ShimmerImageLoader(width: 340.w, height: 160.h);
              },
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                SizedBox(width: 25.w),
                Expanded(
                  child: CustomText(
                    text: "${event.name}",
                    color: AppColors.secondaryText,
                    fontFamily: AppFontNames.gillSansBold,
                    size: 16.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                SizedBox(width: 25.w),
                SvgPicture.asset(
                  "assets/icons/calender.svg",
                  width: 50.w,
                  height: 25.h,
                ),
                SizedBox(width: 5.w),
                CustomText(
                  text: "${event.date}",
                  color: AppColors.secondaryText,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                SizedBox(width: 25.w),
                SvgPicture.asset(
                  "assets/icons/location_glass.svg",
                  width: 50.w,
                  height: 25.h,
                ),
                SizedBox(width: 5.w),
                CustomText(
                  text: "${event.location}",
                  color: AppColors.secondaryText,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // InkWell(
            //   onTap: () {
            //     navigateTo(context,
            //         EventDetailsPage(isEvent: true, id: event.id!));
            //   },
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       CustomText(
            //         text: "See Event Details",
            //         color: AppColors.primary,
            //         size: 14.sp,
            //       ),
            //       SizedBox(
            //         width: 10.w,
            //       ),
            //       SvgPicture.asset(
            //         "assets/icons/arrow_forward.svg",
            //         width: 20.w,
            //         height: 10.h,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
