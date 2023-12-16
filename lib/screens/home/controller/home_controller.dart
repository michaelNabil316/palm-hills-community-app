import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/events/model/event_model.dart';
import 'package:palm_hills/screens/community/community_screen.dart';
import 'package:palm_hills/screens/home/sections/home_screen.dart';
import 'package:palm_hills/screens/my_space/my_space_page.dart';
import '../../../repository/home_repository.dart';
import '../../more/more_screen.dart';

class HomeController extends GetxController {
  String _action = "News";
  int _currentTab = 0;
  List<EventModel> uiModels = [];
  bool loadingData = true;
  List<EventModel> eventsTop5 = [];
  List<EventModel> newsTop5 = [];

  String get action => _action;
  int get currentTab => _currentTab;
  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  getHomeData() async {
    changeLoading(true);
    await getTop5New();
    getTop5Events();
    changeLoading(false);
  }

  getTop5New() async {
    newsTop5 = [];
    update();
    final response = await HomeApi.getNewts(topCount: 5);
    if (response.errorFlag == false) {
      for (var ev in response.values['value']) {
        newsTop5.add(EventModel.fromJson(ev));
      }
      uiModels = [...newsTop5];
    }
    update();
  }

  getTop5Events() async {
    eventsTop5 = [];
    update();
    final response = await HomeApi.getEvents(topCount: 5);
    if (response.errorFlag == false) {
      for (var ev in response.values['value']) {
        eventsTop5.add(EventModel.fromJson(ev));
      }
    }
    update();
  }

  void setCurrentTab(int value) {
    _currentTab = value;
    update();
  }

  void SetAction(String value) {
    _action = value;
    uiModels = [];
    update();
    if (value == "Events") {
      uiModels = [...eventsTop5];
    } else {
      uiModels = [...newsTop5];
    }
    update();
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }
}

final List<Widget> screens = [
  HomeScreen(),
  MySpaceScreen(),
  CommunityScreen(),
  MoreScreen(),
];
