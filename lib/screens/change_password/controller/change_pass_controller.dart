import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../models/user_model.dart';
import '../../../repository/login_repository.dart';
import '../../../shared_components/snack_bar.dart';

class ChangePasswordCtrl extends GetxController {
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();

  bool hideCurrentPass = true;
  bool hideNewPass = true;
  bool stopBtnActivity = true;
  bool passwordHint = false;
  String errorMsg = "";

  Future changePassword(context) async {
    final response = await LoginApi.changePasswordRequest(
        password: newPassController.text, id: userGeneralData!.id!);
    //print("response>> ${response.values}");
    if (response.errorFlag == false) {
      if (response.values != null) {
        setUserData(UserModel.fromJson(response.values));
      }
      showCustomSnackbar(
          context: context,
          isSuccessBar: true,
          message: "You have successfully changed password");
      Navigator.pop(context);
    }
  }

  changeHideCurrentPass() {
    hideCurrentPass = !hideCurrentPass;
    update();
  }

  changeHideNewPass() {
    hideNewPass = !hideNewPass;
    update();
  }

  changeBtnActivity() {
    if (currentPassController.text.isEmpty || newPassController.text.isEmpty) {
      stopBtnActivity = true;
    } else {
      stopBtnActivity = false;
    }
    update();
  }

  bool isErrorMsg() {
    errorMsg = "";
    if (currentPassController.text != userGeneralData!.password) {
      errorMsg = "The current password seems to be Invalid. "
          "Please check and try again.";
      update();
      return true;
    }
    return false;
  }

  showPasswordHint(bool status) {
    passwordHint = status;
    update();
  }
}
