import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:palm_hills/models/user_model.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/response_handler.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  //login
  static Future<ResponseHandlerClass> getUserWithMobil({
    required String dialcode,
    required String phone,
  }) async {
    try {
      String url =
          "${Constants.baseUrl}com_users?\$filter=(endswith(com_mobilenumber, '$phone'))";
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      print("response>> ${response.statusCode}");
      print("response>> ${response.body}");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        return ResponseHandlerClass(
            errorFlag: false,
            values: decodeResponse['value']
                .map<UserModel>((obj) => UserModel.fromJson(obj))
                .toList());
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
      print("error in getUserWithMobil >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> loginRequest({
    required String dialcode,
    required String phone,
    required String password,
  }) async {
    try {
      String url =
          "${Constants.baseUrl}com_users?\$filter=(endswith(com_mobilenumber, '$phone') and (com_password eq '$password'))";
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
            values: decodeResponse['value']
                .map<UserModel>((obj) => UserModel.fromJson(obj))
                .toList());
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
      print("error in loginRequest >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static Future<ResponseHandlerClass> changePasswordRequest(
      {required String password, required String id}) async {
    try {
      String url = "${Constants.baseUrl}com_users($id)";
      var body = {"com_password": password};
      var response = await NLTMAuthServices.client.patch(
        Uri.parse(url),
        headers: Constants.headers,
        body: jsonEncode(body),
      );
      // print('=========   response :  ${response.body} ======');
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
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
      print("error in changePasswordRequest >> $e");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  static sendOtp({
    required dynamic to,
    required dynamic otp,
  }) async {
    // print('OTTTTTTTTTTTTTTP');
    // print('otp number is $otp');
    String url = "https://http-api.d7networks.com/send";
    Map<String, dynamic> body = {
      'to': to,
      'from': 'PHD',
      'content': 'Your OTP is $otp',
      'username': 'naav2680',
      'password': 'jiTBZNqx',
    };
    await http.post(Uri.parse(url), body: body).then(
      (value) {
        print("otp satuscode ${value.statusCode}");
        print('otp send ${value.body}');
      },
    );
  }

  /// post attachments
  // static Future postAttachments({required List<Attachment> requests}) async {
  //   String url = "${Constants.baseUrl}annotations";
  //   print("========== post Attachments url :: $url ==========");
  //   for (var request in requests) {
  //     var response = await NLTMAuthServices.client
  //         .post(Uri.parse(url),
  //             headers: Constants.headers,
  //             body: jsonEncode(request.toJson()),
  //             encoding: encoding)
  //         .catchError((error) {
  //       print(error.toString());
  //     }).timeout(const Duration(seconds: 30));
  //     var decodeResponse =
  //         await NLTMAuthServices.decodeResponse(response: response);
  //     print(
  //         '========== post Attachments response :: $decodeResponse ==========');
  //     if (response.statusCode == 200 ||
  //         response.statusCode == 201 ||
  //         response.statusCode == 204) {
  //     } else {
  //       throw Exception(decodeResponse['message']);
  //     }
  //   }
  // }

  // /// update attachment
  // static Future updateAttachment({required Attachment attachment}) async {
  //   String url = "${Constants.baseUrl}annotations(${attachment.id})";
  //   print("========== update attachment url : $url ==========");
  //   var response = await NLTMAuthServices.client
  //       .patch(Uri.parse(url),
  //           headers: Constants.headers,
  //           body: jsonEncode(attachment.toJson()),
  //           encoding: encoding)
  //       .catchError((error) {
  //     print(error.toString());
  //   }).timeout(const Duration(seconds: 30));
  //   var decodeResponse =
  //       await NLTMAuthServices.decodeResponse(response: response);
  //   print('========== update attachment response : $decodeResponse ==========');
  //   if (response.statusCode == 200 ||
  //       response.statusCode == 201 ||
  //       response.statusCode == 204) {
  //   } else {
  //     throw Exception();
  //   }
  // }

  // /// delete attachment
  // static Future deleteAttachment({required String id}) async {
  //   String url = "${Constants.baseUrl}annotations($id)";
  //   print("========== delete attachment url : $url ==========");
  //   var response = await NLTMAuthServices.client
  //       .delete(Uri.parse(url), encoding: encoding)
  //       .catchError((error) {
  //     print(error.toString());
  //   }).timeout(const Duration(seconds: 30));
  //   if (response.statusCode == 200 ||
  //       response.statusCode == 201 ||
  //       response.statusCode == 204) {
  //   } else {
  //     throw Exception();
  //   }
  // }
}
/**
{"@odata.etag":"W/\"7498382\"","timezoneruleversionnumber@OData.Community.Display.V1.FormattedValue":"0","timezoneruleversionnumber":0,"_owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty":"owningbusinessunit","_owningbusinessunit_value@Microsoft.Dynamics.CRM.lookuplogicalname":"businessunit","_owningbusinessunit_value":"c7e73bb4-5dcd-ed11-93d1-6045bd0f6dd1","com_nationalid":"23456789123456","com_name":"Tester User","statecode@OData.Community.Display.V1.FormattedValue":"Active","statecode":0,"com_relationship@OData.Community.Display.V1.FormattedValue":"Parent","com_relationship":181410002,"statuscode@OData.Community.Display.V1.FormattedValue":"Active","statuscode":1,"com_maritalstatus@OData.Community.Display.V1.FormattedValue":"Single","com_maritalstatus":181410000,"_createdby_value@OData.Community.Display.V1.FormattedValue":"Initium Dev","_createdby_value@Microsoft.Dynamics.CRM.lookuplogicalname":"systemuser","_createdby_value":"71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1","com_password":"Aa12345#","com_birthdate@OData.Community.Display.V1.FormattedValue":"2/1/1995","com_birthdate":"1995-01-31T21:00:00Z","com_email":"tester@phd.com","_ownerid_value@OData.Community.Display.V1.FormattedValue":"Initium Dev","_ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty":"ownerid","_ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname":"systemuser","_ownerid_value":"71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1","modifiedon@OData.Community.Display.V1.FormattedValue":"11/7/2023 6:01 PM","modifiedon":"2023-11-07T15:01:06Z","com_userid":"d00b6d8f-fa77-ee11-93e6-6045bd0f6dd1","_modifiedby_value@OData.Community.Display.V1.FormattedValue":"Initium Dev","_modifiedby_value@Microsoft.Dynamics.CRM.lookuplogicalname":"systemuser","_modifiedby_value":"71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1","_owninguser_value@Microsoft.Dynamics.CRM.lookuplogicalname":"systemuser","_owninguser_value":"71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1","com_mobilenumber":"+201284823321","versionnumber@OData.Community.Display.V1.FormattedValue":"7,498,382","versionnumber":7498382,"com_type@OData.Community.Display.V1.FormattedValue":"Owner","com_type":181410000,"createdon@OData.Community.Display.V1.FormattedValue":"10/31/2023 5:34 PM","createdon":"2023-10-31T14:34:13Z","utcconversiontimezonecode":null,"_modifiedonbehalfby_value":null,"com_tenancyenddate":null,"_com_relatedowner_value":null,"overriddencreatedon":null,"_owningteam_value":null,"_createdonbehalfby_value":null,"_com_relatedaccount_value":null,"com_otp":null,"com_tenancystartdate":null,"importsequencenumber":null}
 
 */