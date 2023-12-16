import 'dart:async';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/constants.dart';
import '../helper/ntlm_helper.dart';
import '../models/compound_model.dart';
import '../models/user_model.dart';

class SharedApi {
  static Future<List<CompoundModel>> getAllCompounds() async {
    try {
      String url =
          "${Constants.baseUrl}com_compounds?\$select=com_compoundid,com_name,_com_relatedproject_value";
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      //print('===============   url :  $url ==========');
      //log('=========   response getAllCompounds :  ${response.body} ======');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        //print("decodeResponse> $decodeResponse");
        List<CompoundModel> allCompounds = [];
        for (var compond in decodeResponse['value']) {
          allCompounds.add(CompoundModel.fromJson(compond));
        }
        return allCompounds;
      } else {
        return [];
      }
    } catch (e) {
      print("error in shared api > $e");
      return [];
    }
  }

  static Future<List<CompoundModel>> getMyCompounds() async {
    try {
      String url = "${Constants.baseUrl}com_units?\$select=com_name"
          "&\$expand=com_Compound(\$select=com_name;\$expand=com_RelatedProject(\$select=advanced_buildingno,advanced_block))"
          "&\$filter=(_com_owninguser_value eq ${userGeneralData!.id})";
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      // print('===============   url :  $url ==========');
      // print('=========   response getAllCompounds :  ${response.body} ======');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        List<CompoundModel> myCompounds = [];
        for (var compond in decodeResponse['value']) {
          myCompounds.add(CompoundModel.fromJson(compond['com_Compound']));
        }
        return myCompounds;
      } else {
        return [];
      }
    } catch (e) {
      print("error in shared api > $e");
      return [];
    }
  }

  static Future<List<UserModel>> getFamilyRequest() async {
    try {
      String url =
          "${Constants.baseUrl}com_users?\$filter=(_com_relatedowner_value eq ${userGeneralData!.id})";
      var response = await NLTMAuthServices.client.get(Uri.parse(url),
          headers: {"Prefer": "odata.include-annotations=*"});
      // print('===============   url :  $url ==========');
      // print('=========   response getAllCompounds :  ${response.body} ======');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        var decodeResponse =
            await NLTMAuthServices.decodeResponse(response: response);
        List<UserModel> myFamily = [];
        for (var compond in decodeResponse['value']) {
          myFamily.add(UserModel.fromJson(compond));
        }
        return myFamily;
      } else {
        return [];
      }
    } catch (e) {
      print("error in shared api > $e");
      return [];
    }
  }
}
