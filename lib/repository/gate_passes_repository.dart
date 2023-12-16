import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class GatePassesApi {
  static Future<ResponseHandlerClass> getMyGatePasses() async {
    try {
      String url = "${Constants.baseUrl}com_gatepasses?"
          "\$filter=(_com_relatedowner_value eq ${userGeneralData!.id})";

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
      print("error in getAllMyUnites Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> deletePassRequest(
      {required String id}) async {
    try {
      String url = "${Constants.baseUrl}com_gatepasses($id)";
      var response = await NLTMAuthServices.client.delete(
        Uri.parse(url),
        headers: Constants.headers,
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(errorFlag: false);
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
      print("error in deleteVehicle Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> createNewGatePass({
    required String name,
    required int passType,
    required int guestType,
    required DateTime entryDate,
    DateTime? endDate,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_gatepasses?";
      var body = {
        "com_name": name,
        "com_type": passType,
        "com_guesttype": guestType,
        "com_entrydate": entryDate.toIso8601String(),
        "com_RelatedOwner@odata.bind": "com_users(${userGeneralData!.id})",
      };
      if (endDate != null) {
        body['com_enddate'] = endDate.toIso8601String();
      }
      print("endDate>> $endDate");
      print("body>> $body");
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

  static Future<ResponseHandlerClass> changeStatusRequest({
    required String id,
    required bool value,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_gatepasses($id)";
      var body = {"statecode": value == true ? 1 : 2};
      var response = await NLTMAuthServices.client.patch(Uri.parse(url),
          body: jsonEncode(body), headers: Constants.headers);
      // print("changeStatusRequest api status code ${response.statusCode}");
      // print("changeStatusRequest api status code ${response.body}");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(errorFlag: false);
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
