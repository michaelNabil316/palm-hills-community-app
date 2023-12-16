import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_app_bars/app_bar_one_line.dart';
import 'package:palm_hills/shared_components/loader_widget.dart';
import '../../../helper/navigation.dart';
import '../../home/main_page_bottom_nav.dart';
import '../../home/sections/custom_bottom_nav.dart';
import '../../home/sections/floating_action_button.dart';
import 'controller/reservation_controller.dart';
import 'reservation_details.dart';
import 'widgets/reservation_card.dart';

class AllReservationScreen extends StatefulWidget {
  AllReservationScreen({super.key});

  @override
  State<AllReservationScreen> createState() => _AllReservationScreenState();
}

class _AllReservationScreenState extends State<AllReservationScreen> {
  final con = Get.put(ReservationCtrl());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      con.getAllList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButoonCustomization(),
      bottomNavigationBar: CustomBottomNav(
        onTapFromSubScreen: () {
          navigateAndFinish(context, MainPageBottomNav());
        },
      ),
      appBar: appBarOneLine(
          title: "MY RESERVATIONS",
          onPressBackBtn: () => Navigator.pop(context)),
      body: GetBuilder<ReservationCtrl>(
        builder: (_) {
          return con.loadingData
              ? LoadingData()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: con.allEventsReservation.length,
                        itemBuilder: (context, index) {
                          return ReservationCard(
                            event: con.allEventsReservation[index],
                            onTap: () {
                              navigateTo(
                                context,
                                ReservationDetails(
                                  event: con.allEventsReservation[index],
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 30.h);
                        },
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
