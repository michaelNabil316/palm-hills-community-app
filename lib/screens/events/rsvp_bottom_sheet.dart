import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/events/model/event_model.dart';
import 'package:palm_hills/screens/events/widgets/terms_conditions_row.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../shared_components/custom_text.dart';
import '../../helper/styles.dart';
import 'controller/events_controller.dart';
import 'widgets/plus_btn.dart';
import 'widgets/terms_item.dart';

class RsvpBottomSheet extends StatelessWidget {
  final EventModel event;
  const RsvpBottomSheet({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllEventsCtrl>(
      init: AllEventsCtrl(),
      builder: (controller) {
        return Container(
          height: 0.5.sh,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "RSVP Event",
                      size: 18.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/close_icon.svg",
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomText(
                text: "Number of People",
                size: 14.sp,
                color: Colors.grey,
              ),
              SizedBox(height: 12.h),
              Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlusBtn(
                    text: "-",
                    padTop: 4.h,
                    isActive: controller.minBtnActive,
                    onTap: () {
                      controller.minimizeCounter();
                    },
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      height: 48.w,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: CustomText(
                          text: "${controller.peopleCount}",
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  PlusBtn(
                    text: "+",
                    isActive: controller.plusBtnActive,
                    onTap: () {
                      controller.maxCounter();
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () => controller.changeTerms(),
                child: TermsConditionsRow(isSelected: controller.isAcceptTerms),
              ),
              SizedBox(height: 14.h),
              TermsItem(
                text: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet."
                    " Lorem ipsum dolor sit amet.",
              ),
              SizedBox(height: 5.h),
              TermsItem(text: "Lorem ipsum dolor sit amet."),
              SizedBox(height: 5.h),
              TermsItem(text: "Lorem ipsum dolor sit amet."),
              SizedBox(height: 25.h),
              CustomLargeButton(
                onPressed: () async {
                  if (controller.stopReserveBtn()) {
                    await controller.reserveEvent(event, context);
                  }
                },
                text: "Reserve",
                noIcon: true,
                stopBtnActivity: !controller.stopReserveBtn(),
              ),
            ],
          ),
        );
      },
    );
  }
}
