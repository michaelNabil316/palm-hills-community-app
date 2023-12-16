import 'dart:async';
import 'dart:io';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';

class UnitApi {
  static Future<ResponseHandlerClass> getAllMyUnites() async {
    try {
      String url = "${Constants.baseUrl}com_units?"
          "\$filter=(_com_owninguser_value eq ${userGeneralData!.id}) "
          "&\$expand=com_RelatedUnit(\$select=_blser_region_value)"
          "&\$select=com_name,statuscode,_ownerid_value,_com_compound_value,statecode";
      //"com_RelatedUnit(\$select=blser_region)";
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
      print("error in getAllMyUnites Request >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }
}
