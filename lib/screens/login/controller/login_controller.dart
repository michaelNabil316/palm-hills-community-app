import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../../../repository/login_repository.dart';
import '../../user_data.dart';

class LoginCtrl extends GetxController {
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();

  bool hidePass = true;
  String dialCode = "";
  String errorMsg = "";
  UserModel? userData;

  changehidePass() {
    hidePass = !hidePass;
    update();
  }

  Future<bool> loginProcess() async {
    errorMsg = "";
    update();
    final response = await LoginApi.getUserWithMobil(
        dialcode: dialCode, phone: mobileController.text);
    print("response>> ${response.errorFlag}");
    print("response>> ${response.values}");
    if (response.errorFlag) {
      errorMsg = response.errorMessage;
    } else if (response.values != null) {
      if (response.values.isEmpty) {
        errorMsg = "This account not exist";
      } else {
        for (UserModel user in response.values) {
          if (user.password == passwordController.text) {
            userData = user;
            await setUserData(user);
            await getMyCompounds();
            update();
            return true;
          }
        }
        if (userData == null) {
          errorMsg = "Email or password not correct";
        }
      }
    }
    update();
    return false;
  }

  changeSelectedDialCode(String code) {
    dialCode = code;
    update();
  }

  clearData() {
    mobileController.clear();
    passwordController.clear();
    hidePass = true;
    dialCode = "";
    errorMsg = "";
    userData = null;
    update();
  }
}
