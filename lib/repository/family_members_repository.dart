import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class FamilyApi {
  static Future<ResponseHandlerClass> getAllMyFamilyMembers() async {
    try {
      String url =
          "${Constants.baseUrl}com_users?\$filter=(_com_relatedowner_value eq ${userGeneralData!.id})";
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      print('===============   url :  $url ==========');
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
      print("error in getAllMyVehicles Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> deleteFamilyMembersRequest(
      String id) async {
    try {
      String url = "${Constants.baseUrl}com_users($id)";

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

  static Future<ResponseHandlerClass> deleteVehicle({
    required String id,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_vehicles($id)";

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

  static Future<ResponseHandlerClass> editVehicle({
    required String id,
    required String name,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_vehicles($id)";
      var body = {"com_name": name};
      var response = await NLTMAuthServices.client.patch(Uri.parse(url),
          headers: Constants.headers, body: jsonEncode(body));
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
      print("error in editVehicle Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }
}
