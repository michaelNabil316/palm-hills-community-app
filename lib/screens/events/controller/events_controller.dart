import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../models/response_handler.dart';
import '../../../repository/event_repository.dart';
import '../../../repository/home_repository.dart';
import '../../../repository/reservation_repository.dart';
import '../model/event_model.dart';
import '../widgets/dialog_reserved_success.dart';

class AllEventsCtrl extends GetxController {
  int peopleCount = 0;
  bool minBtnActive = false;
  bool plusBtnActive = true;
  bool isAcceptTerms = false;
  bool loadingData = false;
  List allEvents = [];
  EventModel? selectedEvent;

  getAllList(bool isEvents) async {
    changeLoading(true);
    allEvents = [];
    update();
    ResponseHandlerClass response = ResponseHandlerClass(errorFlag: true);
    if (isEvents) {
      response = await HomeApi.getEvents();
    } else {
      response = await HomeApi.getNewts();
    }
    if (response.errorFlag == false) {
      for (var ev in response.values['value']) {
        allEvents.add(EventModel.fromJson(ev));
      }
    }
    update();
    changeLoading(false);
  }

  getEventDetails(String id, bool isEvents) async {
    selectedEvent = null;
    changeLoading(true);
    ResponseHandlerClass response = ResponseHandlerClass(errorFlag: true);
    if (isEvents) {
      response = await EventApi.getEventDetails(id);
      if (response.errorFlag == false && response.values.length > 0) {
        selectedEvent = EventModel.fromJson(response.values['value'][0]);
      }
    } else {
      response = await EventApi.getNewtsDetails(id);
      if (response.errorFlag == false) {
        selectedEvent = EventModel.fromJson(response.values);
      }
    }
    update();
    changeLoading(false);
  }

  reserveEvent(EventModel event, context) async {
    final response = await ReservationApi.postNewReserve(
        eventid: "${event.id}",
        count: "$peopleCount",
        name: "${event.name} $peopleCount for ${userGeneralData?.name}");
    if (response.errorFlag == false) {
      Navigator.pop(context);
      getEventDetails(event.id!, true);
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ReservedSuccessDialog(event: event);
        },
      );
    }
  }

  minimizeCounter() {
    if (peopleCount > 0) {
      peopleCount--;
    }
    if (peopleCount == 0) {
      minBtnActive = false;
    }
    update();
  }

  maxCounter() {
    peopleCount++;
    minBtnActive = true;
    update();
  }

  changeTerms() {
    isAcceptTerms = !isAcceptTerms;
    update();
  }

  bool stopReserveBtn() {
    if (peopleCount > 0 && isAcceptTerms == true) {
      return true;
    }
    return false;
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }
}
