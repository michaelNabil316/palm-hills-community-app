import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

import '../../../shared_components/divider_vertical.dart';

class EventDates extends StatelessWidget {
  final String location;
  final DateTime? date;
  const EventDates({
    super.key,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      color: AppColors.whiteSugaer,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/location_glass.svg",
                    height: 25.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(text: location, size: 14.sp),
                ],
              ),
              CustomVerticalDivider(height: 40.h, marginHorizontal: 7.w),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/calender.svg",
                    height: 25.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                      text: date != null
                          ? DateFormat('d MMM yyyy').format(date!)
                          : "",
                      size: 14.sp),
                ],
              ),
              CustomVerticalDivider(height: 40.h, marginHorizontal: 7.w),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/time_watch.svg",
                    height: 25.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                      text:
                          date != null ? DateFormat('h:m a').format(date!) : "",
                      size: 14.sp),
                ],
              ),
              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
