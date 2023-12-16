import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line.dart';
import '../../shared_components/loader_widget.dart';
import '../home/main_page_bottom_nav.dart';
import '../home/sections/custom_bottom_nav.dart';
import '../home/sections/floating_action_button.dart';
import '../home/sections/listview_item.dart';
import 'controller/events_controller.dart';

class AllEvents extends StatefulWidget {
  final bool isEvents;
  const AllEvents({
    super.key,
    required this.isEvents,
  });

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  final con = Get.put(AllEventsCtrl(), permanent: true);
  @override
  void initState() {
    super.initState();
    con.getAllList(widget.isEvents);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllEventsCtrl>(
      builder: (_) {
        return Scaffold(
          appBar: appBarOneLine(
              title: widget.isEvents ? "All Events" : "All News",
              onPressBackBtn: () => Navigator.pop(context)),
          body: con.loadingData
              ? LoadingData()
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: con.allEvents.length,
                  itemBuilder: (context, index) => ListViewItem(
                    isAllPage: true,
                    Title: con.allEvents[index].name ?? "",
                    date: con.allEvents[index].date ?? "",
                    id: con.allEvents[index].id,
                    isEvent: widget.isEvents,
                  ),
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButoonCustomization(),
          bottomNavigationBar: CustomBottomNav(
            onTapFromSubScreen: () {
              navigateAndFinish(context, MainPageBottomNav());
            },
          ),
        );
      },
    );
  }
}
