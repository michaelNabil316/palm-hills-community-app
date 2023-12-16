import 'dart:async';
import 'dart:io';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class EventApi {
  static Future<ResponseHandlerClass> getEventDetails(String id) async {
    try {
      String url =
          "${Constants.baseUrl}com_events?\$expand=com_com_event_com_eventreservation_Event";

      if (userGeneralData != null) {
        url +=
            "(\$select=com_allowedguests,com_name;\$filter=(_com_user_value eq ${userGeneralData!.id}))&\$filter=(com_eventid eq $id)";
      } else {
        url +=
            "(\$select=com_allowedguests,com_name)&\$filter=(com_eventid eq $id)";
      }
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      // print('===============   url :  $url ==========');
      // log('=========   response :  ${response.body} ======');
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
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> getNewtsDetails(String id) async {
    try {
      String url = "${Constants.baseUrl}com_updates($id)";
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      // print('===============   url :  $url ==========');
      // print('=========   response :  ${response.body} ======');
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
      print("error in getNewtsDetails >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> getEventImage(
      String id, bool isEvent) async {
    try {
      String url = isEvent
          ? "${Constants.baseUrl}com_events($id)/com_eventpicture"
          : "${Constants.baseUrl}com_updates($id)/com_newspicture";

      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      // print('===============   url :  $url ==========');
      // print('=========   response :  ${response.body} ======');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        return ResponseHandlerClass(
          errorFlag: false,
          values: decodeResponse['value'],
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
      print("error in getNewtsDetails >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }
}
