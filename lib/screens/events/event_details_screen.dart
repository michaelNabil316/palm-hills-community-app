import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/events/controller/events_controller.dart';
import 'package:palm_hills/screens/splash_screen.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import 'package:share_plus/share_plus.dart';
import '../../helper/firebase_helper/dynamic_link.dart';
import '../../helper/navigation.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line.dart';
import '../../shared_components/loader_widget.dart';
import '../more/reservation/reservation_details.dart';
import 'rsvp_bottom_sheet.dart';
import 'widgets/event_image.dart';
import 'widgets/event_dates.dart';
import 'widgets/fundraiser_item.dart';
import 'widgets/reserved_for_accounts.dart';

class EventDetailsPage extends StatefulWidget {
  final bool isEvent;
  final String id;
  const EventDetailsPage({
    super.key,
    required this.isEvent,
    required this.id,
  });

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final con = Get.put(AllEventsCtrl(), permanent: true);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      con.getEventDetails(widget.id, widget.isEvent);
    });
  }

  Future<bool> canPopFromScreen() async {
    if (Navigator.canPop(context) == true) {
      return true;
    } else {
      navigateAndFinish(context, SplashScreen());
    }
    return false;
  }

  popFromScreen() async {
    if (Navigator.canPop(context) == true) {
      Navigator.pop(context);
    } else {
      navigateAndFinish(context, SplashScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllEventsCtrl>(
      builder: (_) {
        return WillPopScope(
          onWillPop: canPopFromScreen,
          child: Stack(
            children: [
              //use stack to put loading widget on screen
              Scaffold(
                body: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          appBarOneLine(
                              title: widget.isEvent
                                  ? "EVENT DETAILS"
                                  : "NEWS DETAILS",
                              onPressBackBtn: () => popFromScreen(),
                              allHeight: 60.h + 165.h,
                              titleSize: 16.sp),
                          if (con.selectedEvent != null)
                            EventImage(
                              id: con.selectedEvent!.id,
                              isEvent: widget.isEvent,
                            ),
                        ],
                      ),
                      if (con.selectedEvent != null)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 150.h),
                              if (con.selectedEvent!.eventReason != null)
                                FundraiserItem(
                                    title: "${con.selectedEvent!.eventReason}"),
                              SizedBox(height: 11.h),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: con.selectedEvent!.name,
                                fontFamily: AppFontNames.gillSansBold,
                                size: 18.sp,
                              ),
                              if (widget.isEvent) SizedBox(height: 11.h),
                              if (widget.isEvent)
                                EventDates(
                                  location: con.selectedEvent!.location,
                                  date: con.selectedEvent!.date,
                                ),
                              SizedBox(height: 21.h),
                              if (con
                                  .selectedEvent!.eventreservation.isNotEmpty)
                                ReservedForAccounts(
                                  text:
                                      "${con.selectedEvent!.eventreservation[0]['com_allowedguests']}",
                                ),
                              SizedBox(height: 21.h),
                              Row(
                                children: [
                                  CustomText(
                                    text: "About the",
                                    fontFamily: AppFontNames.gillSansBold,
                                    size: 16.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  CustomText(
                                    text: widget.isEvent ? "Event" : "News",
                                    fontFamily: AppFontNames.gillSansBold,
                                    size: 16.sp,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                              SizedBox(height: 11.h),
                              CustomText(
                                  textAlign: TextAlign.start,
                                  text: con.selectedEvent!.description ?? ""),
                              SizedBox(height: 25.h),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                bottomNavigationBar: con.selectedEvent != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 20.h),
                        child: Row(
                          children: [
                            if (widget.isEvent && userGeneralData != null)
                              GestureDetector(
                                onTap: () {
                                  Share.share("palm hills event.");
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  radius: 26.r,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25.r,
                                    child: SvgPicture.asset(
                                        "assets/icons/share_icon.svg"),
                                  ),
                                ),
                              ),
                            if (widget.isEvent) SizedBox(width: 20.w),
                            Expanded(
                              child: widget.isEvent && userGeneralData != null
                                  ? CustomLargeButton(
                                      onPressed: () {
                                        if (widget.isEvent) {
                                          if (con.selectedEvent!
                                              .eventreservation.isNotEmpty) {
                                            navigateTo(
                                              context,
                                              ReservationDetails(
                                                event: con.selectedEvent!,
                                              ),
                                            );
                                          } else {
                                            showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return RsvpBottomSheet(
                                                    event: con.selectedEvent!);
                                              },
                                            );
                                          }
                                        }
                                      },
                                      text: con.selectedEvent!.eventreservation
                                              .isNotEmpty
                                          ? "View My Reservaion"
                                          : "RSVP",
                                    )
                                  : CustomLargeButton(
                                      onPressed: () async {
                                        print("....");
                                        var generatedLink =
                                            await createDynamicLink(
                                          id: widget.id,
                                          pageName:
                                              widget.isEvent ? "Event" : "News",
                                        );
                                        print("generatedLink $generatedLink");
                                        await Share.share("${generatedLink}");
                                      },
                                      text: widget.isEvent
                                          ? "Share Event"
                                          : "Share News",
                                      noIcon: !widget.isEvent,
                                    ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
              if (con.selectedEvent == null) LoadingData(),
            ],
          ),
        );
      },
    );
  }
}
