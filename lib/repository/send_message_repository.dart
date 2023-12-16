import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class SendUsMessageApi {
  static Future<ResponseHandlerClass> sendMessage({
    required String name,
    required String compoundName,
    required String phone,
    required String message,
  }) async {
    try {
      String url = "${Constants.baseUrl}leads?";
      var body = {
        "subject": "$name interested in ${compoundName}",
        "lastname": "$name",
        "new_tenanttype": "100000000", //indivistual
        "mobilephone": "$phone",
        "description": "$message",
      };
      print("response body>> ${jsonEncode(body)}");
      var response = await NLTMAuthServices.client.post(
        Uri.parse(url),
        headers: Constants.headers,
        body: jsonEncode(body),
      );

      print("response>> ${response.statusCode}");
      print("response>> ${response.body}");
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
      print("error in send sales message >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }
}
