import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';
import '../screens/user_data.dart';

class ReservationApi {
  static Future<ResponseHandlerClass> getEventReservation() async {
    try {
      String url = "${Constants.baseUrl}com_events?"
          "\$expand=com_com_event_com_eventreservation_Event(\$filter=(_com_user_value eq ${userGeneralData!.id}))&\$filter=(com_com_event_com_eventreservation_Event/any(o1:(o1/_com_user_value eq ${userGeneralData!.id})))";
      print('===============   url :  $url ==========');
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      print('=========   response :  ${response.body} ======');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        return ResponseHandlerClass(
          errorFlag: false,
          values: decodeResponse,
        );
      } else {
        return ResponseHandlerClass(errorFlag: true);
      }
    } on TimeoutException {
      return ResponseHandlerClass(
          errorFlag: true, errorMessage: 'Server timeout');
    } on SocketException {
      return ResponseHandlerClass(
          errorFlag: true, errorMessage: 'Internet Connection Error');
    } catch (e) {
      print("error in getEvents >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> postNewReserve({
    required String name,
    required String eventid,
    required String count,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_eventreservations?";
      var body = {
        "com_name": name,
        "com_allowedguests": count,
        "com_Event@odata.bind": "com_events($eventid)",
        "com_User@odata.bind": "com_users(${userGeneralData!.id})",
      };
      var response = await NLTMAuthServices.client.post(
        Uri.parse(url),
        headers: Constants.headers,
        body: jsonEncode(body),
      );
      // print("com_gatepasses response>> ${response.statusCode}");
      // print("com_gatepasses response>> ${response.body}");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        return ResponseHandlerClass(errorFlag: false, values: decodeResponse);
      } else {
        return ResponseHandlerClass(errorFlag: true);
      }
    } on TimeoutException {
      return ResponseHandlerClass(
          errorFlag: true, errorMessage: 'Server timeout');
    } on SocketException {
      return ResponseHandlerClass(
          errorFlag: true, errorMessage: 'Internet Connection Error');
    } catch (e) {
      print("error in postNewRequest >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }
}
