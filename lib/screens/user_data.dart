import 'dart:convert';
import 'package:palm_hills/helper/cash_helper/keys_name.dart';
import 'package:palm_hills/helper/cash_helper/shared_pref.dart';
import 'package:palm_hills/models/user_model.dart';
import '../models/compound_model.dart';
import '../repository/shared_repository.dart';

UserModel? userGeneralData;
List<UserModel> myFamily = [];
List<CompoundModel> appCompounds = [];
List<CompoundModel> myCompounds = [];

getMySharedData() {
  getAppCompounds();
  getMyCompounds();
  getMyFmilyList();
}

setUserData(UserModel user) {
  userGeneralData = user;
  CacheHelper.saveData(
      key: KeysName.userData, value: jsonEncode(user.toJson()));
}

getCachedUserData() {
  final data = CacheHelper.getData(KeysName.userData);
  if (data != null) {
    userGeneralData = UserModel.fromJson(jsonDecode(data));
  }
}

getAppCompounds() async {
  List<CompoundModel> data = await SharedApi.getAllCompounds();
  appCompounds = data;
  print("appCompoudnds length > ${appCompounds.length}");
}

getMyCompounds() async {
  if (userGeneralData != null) {
    var data = await SharedApi.getMyCompounds();
    myCompounds = data;
    print("getMyCompounds length > ${myCompounds.length}");
  }
}

getMyFmilyList() async {
  if (userGeneralData != null) {
    var data = await SharedApi.getFamilyRequest();
    myFamily = data;
    print("myFamily length > ${myFamily.length}");
  }
}
