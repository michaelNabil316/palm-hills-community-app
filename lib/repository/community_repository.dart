import 'dart:async';
import 'dart:io';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class CommunityApi {
  static Future<ResponseHandlerClass> getAnnouncementsRequest() async {
    try {
      List<String> myCompoundsListData = [];
      for (var e in myCompounds) {
        myCompoundsListData.add("'${e.comCompoundid}'");
      }
      String url =
          "${Constants.baseUrl}com_updates?\$select=com_location,_com_compound_value,com_name,com_description,com_newspicture,com_newsdateandtime"
          "&\$filter=(com_type eq 181410001 and (Microsoft.Dynamics.CRM.In(PropertyName='com_compound',PropertyValues=";
      url += "$myCompoundsListData";
      url += ")))";
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

  static Future<ResponseHandlerClass> getAnnouncementImage(String id) async {
    try {
      String url = "${Constants.baseUrl}com_updates($id)/com_newspicture";

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
