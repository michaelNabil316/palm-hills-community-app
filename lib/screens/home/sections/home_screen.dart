import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/screens/home/controller/home_controller.dart';
import 'package:palm_hills/screens/home/sections/listview_item.dart';
import 'package:palm_hills/screens/home/sections/news_and_events_btn.dart';
import 'package:palm_hills/screens/home/sections/sales_launches.dart';
import 'package:palm_hills/screens/home/widgets/view_all_container.dart';
import '../../../shared_components/two_colored_titles.dart';
import '../../events/all_events.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (con) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: con.loadingData
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(height: Platform.isAndroid ? 175.h : 200.h),
                      NewsAndEvents(),
                      SizedBox(height: 20.h),
                      //PageView
                      Container(
                        height: 320.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              ...con.uiModels
                                  .take(4)
                                  .map((e) => ListViewItem(
                                        isAllPage: false,
                                        Title: e.name,
                                        date: e.date,
                                        id: e.id ?? "",
                                        isEvent: con.action == "Events",
                                      ))
                                  .toList(),
                              if (con.uiModels.length > 4)
                                GestureDetector(
                                  child: ViewAllContainer(),
                                  onTap: () => navigateTo(
                                    context,
                                    AllEvents(isEvents: con.action == "Events"),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   physics: BouncingScrollPhysics(),
                        //   itemCount:
                        //       con.uiModels.length > 4 ? 5 : con.uiModels.length,
                        //   itemBuilder: (context, index) {
                        //     return index < 4
                        //         ? ListViewItem(
                        //             isAllPage: false,
                        //             Title: con.uiModels[index].name,
                        //             date: con.uiModels[index].date,
                        //             id: con.uiModels[index].id ?? "",
                        //             isEvent: con.action == "Events",
                        //           )
                        //         : GestureDetector(
                        //             child: ViewAllContainer(),
                        //             onTap: () => navigateTo(
                        //               context,
                        //               AllEvents(
                        //                   isEvents: con.action == "Events"),
                        //             ),
                        //           );
                        //   },
                        // ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          SizedBox(width: 25.w),
                          TwoColoredTexts(txt1: "SALES", txt2: "LAUNCHES"),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      SalesLaunchesSection(),
                      SizedBox(height: 130.h),
                    ],
                  ),
          );
        });
  }
}
