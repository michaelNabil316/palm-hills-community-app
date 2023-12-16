import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:palm_hills/helper/constants.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../repository/event_repository.dart';
import '../../../shared_components/custom_buttons/button_small.dart';
import '../../events/event_details_screen.dart';
import '../../more/reservation/widgets/shimmer_image.dart';

class ListViewItem extends StatelessWidget {
  ListViewItem({
    super.key,
    required this.isAllPage,
    required this.date,
    required this.Title,
    required this.isEvent,
    required this.id,
  });

  final String Title;
  final DateTime? date;
  final bool isEvent;
  final bool isAllPage;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: isAllPage ? 30.h : 0),
              height: 250.h,
              width: isAllPage ? double.infinity : 300.w,
              child: FutureBuilder(
                future: EventApi.getEventImage(id, isEvent),
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
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: isAllPage ? 30.h : 0),
              height: 250.h,
              width: isAllPage ? double.infinity : 300.w,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  bottom: 16.h,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondaryText,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: isEvent ? 50.w : 70.w,
                                height: 5.h,
                                decoration:
                                    BoxDecoration(color: AppColors.primary)),
                            Container(
                              alignment: Alignment.center,
                              width: isEvent ? 50.w : 70.w,
                              height: isEvent ? 70.h : 50.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff2c3a54),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: SizedBox(
                                width: isEvent ? 30.w : 70.w,
                                child: CustomText(
                                  text: date != null
                                      ? DateFormat('d MMM').format(date!)
                                      : "",
                                  fontFamily: AppFontNames.gillSansBold,
                                  color: Colors.white,
                                  size: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16.w),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            textAlign: TextAlign.start,
                            text: Title,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomSmallButton(
            onPressed: () {
              navigateTo(context, EventDetailsPage(isEvent: isEvent, id: id));
            },
            text: "Read More",
          ),
        ),
      ],
    );
  }
}
