import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/screens/events/model/event_model.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../../more/reservation/reservation_details.dart';

class ReservedSuccessDialog extends StatelessWidget {
  final EventModel event;
  const ReservedSuccessDialog({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      content: Container(
        height: 220.h,
        width: 300.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/document_success.svg",
              height: 44.h,
            ),
            SizedBox(height: 16.h),
            CustomText(
              size: 20.sp,
              text: "You reserved the event success",
              fontFamily: AppFontNames.gillSansBold,
            ),
            SizedBox(height: 40.h),
            CustomLargeButton(
              onPressed: () {
                navigateTo(context, ReservationDetails(event: event));
              },
              text: "View My Reservation",
            ),
          ],
        ),
      ),
    );
  }
}
