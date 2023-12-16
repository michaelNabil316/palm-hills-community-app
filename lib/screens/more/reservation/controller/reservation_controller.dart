import 'package:get/get.dart';
import '../../../../models/response_handler.dart';
import '../../../../repository/reservation_repository.dart';
import '../../../events/model/event_model.dart';

class ReservationCtrl extends GetxController {
  bool loadingData = false;
  List allEventsReservation = [];
  EventModel? selectedEvent;

  getAllList() async {
    allEventsReservation = [];
    changeLoading(true);
    ResponseHandlerClass response = await ReservationApi.getEventReservation();
    print('=============== ${response.errorFlag}');
    print('=============== ${response.errorMessage}');
    print('=============== ${response.values}');
    if (response.errorFlag == false) {
      for (var ev in response.values['value']) {
        allEventsReservation.add(EventModel.fromJson(ev));
      }
    }
    changeLoading(false);
  }

  // getEventDetails(String id, bool isEvents) async {
  //   selectedEvent = null;
  //   changeLoading(true);
  //   ResponseHandlerClass response =   await EventApi.getEventDetails(id);
  //     if (response.errorFlag == false && response.values.length > 0) {
  //       selectedEvent = EventModel.fromJson(response.values['value'][0]);
  //     }
  //   update();
  //   changeLoading(false);
  // }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }
}
