import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class ChooseneighbourApi {
  static Future<ResponseHandlerClass> postNewRequest({
    required String name,
    required String phone,
    required String note,
  }) async {
    try {
      String url = "${Constants.baseUrl}com_chooseneighborrequests?";
      var body = {
        "com_name": name,
        "com_mobilenumber": phone,
        "com_notes": note,
      };
      var response = await NLTMAuthServices.client.post(
        Uri.parse(url),
        headers: Constants.headers,
        body: jsonEncode(body),
      );
      print("response>> ${response.statusCode}");
      log("response>> ${response.body}");
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
