import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/home/controller/home_controller.dart';
import 'package:palm_hills/screens/home/sections/custom_bottom_nav.dart';
import 'package:palm_hills/screens/home/sections/floating_action_button.dart';
import '../../shared_components/custom_app_bars/home_app_bar_with_svg_background.dart';
import '../../shared_components/loader_widget.dart';

class MainPageBottomNav extends StatelessWidget {
  MainPageBottomNav({super.key});
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (con) {
        return Stack(
          children: [
            Scaffold(
              appBar: con.currentTab != 3
                  ? homeAppBarNew(
                      context: context,
                      noBackArrow: true,
                      isShowMyName: con.currentTab == 0)
                  : null,
              extendBodyBehindAppBar: true,
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              floatingActionButton: FloatingActionButoonCustomization(),
              bottomNavigationBar: CustomBottomNav(),
              body: PageStorage(
                child: screens[con.currentTab],
                bucket: bucket,
              ),
            ),
            if (con.loadingData) LoadingData()
          ],
        );
      },
    );
  }
}
