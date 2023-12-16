import 'dart:async';
import 'dart:io';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class TermsApi {
  static Future<ResponseHandlerClass> getTermsRequest({String? type}) async {
    try {
      String url =
          "${Constants.baseUrl}com_appsettingses?\$select=com_description,com_name&\$filter=(com_type eq ${type ?? 181410001})";
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
      print("error in getEvents >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }
}
