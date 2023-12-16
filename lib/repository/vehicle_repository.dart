import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class VehiclesApi {
  static Future<ResponseHandlerClass> getAllMyVehicles(
      {required String filterValue}) async {
    try {
      String url = "${Constants.baseUrl}com_vehicles?\$filter=$filterValue";
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
      print("error in getAllMyVehicles Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> postNewVehicle({
    required String ownerId,
    required String make,
    required String model,
    required String year,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_vehicles?";
      var body = {
        "com_name": make,
        "com_model": model,
        "com_year": year,
        "com_RelatedOwner@odata.bind": "com_users(${ownerId})",
      };
      var response = await NLTMAuthServices.client.post(
        Uri.parse(url),
        headers: Constants.headers,
        body: jsonEncode(body),
      );
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
      print("error in postNewVehicle Request >> $e");
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
    required String make,
    required String model,
    required String year,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_vehicles($id)";
      var body = {
        "com_name": make,
        "com_model": model,
        "com_year": year,
        "statecode": 0,
      };
      var response = await NLTMAuthServices.client.patch(Uri.parse(url),
          headers: Constants.headers, body: jsonEncode(body));
      // print('===============   url :  $url ==========');
      // print('=========   response :  ${response.body} ======');
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
      print("error in editVehicle Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> getVehicleLicenseImage(String id) async {
    try {
      String url =
          "${Constants.baseUrl}com_vehicles($id)/com_carlicensepicture";

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

  static Future<ResponseHandlerClass> postVehicleLicenseImageFile({
    required String id,
    required String imageBase64,
  }) async {
    Map<String, String> fileHeaders = {
      "Content-Type": "application/octet-stream",
      "x-ms-file-name": "license_image"
    };
    try {
      String url =
          "${Constants.baseUrl}com_vehicles($id)/com_carlicensepicture";

      var response = await NLTMAuthServices.client.patch(Uri.parse(url),
          body: base64Decode(imageBase64), headers: fileHeaders);
      print("attach image api status code ${response.statusCode}");
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
