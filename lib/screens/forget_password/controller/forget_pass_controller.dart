import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../../../repository/login_repository.dart';

class ForgetPassCtrl extends GetxController {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final int seconds = 300;
  final oneSec = const Duration(seconds: 1);
  bool showPass = false;
  bool stopSendBtn = true;
  bool hidePass = true;
  int start = 60;
  Timer? timer;
  String errorMsg = "";
  String errorOtp = "";
  String dialCode = "+20";
  UserModel? userData;
  String otp = "";
  bool isOtpCorrect = false;

  Future<bool> startProcess() async {
    final isEmailExist = await checkEmailExistinr();
    if (isEmailExist == true) {
      await sendOtp();
    } else {
      errorMsg = "This Email not exist";
      return false;
    }
    return true;
  }

  Future<bool> checkEmailExistinr() async {
    errorMsg = "";
    update();
    //is this account exist
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
        userData = response.values[0];
        update();
        return true;
      }
    }
    update();
    return false;
  }

  Future<bool> resetPassword() async {
    errorMsg = "";
    update();
    final response = await LoginApi.changePasswordRequest(
        password: passwordController.text, id: userData!.id!);
    print("response>> ${response.errorFlag}");
    return response.errorFlag;
  }

  sendOtp() async {
    final Random random = Random();
    otp = "${1000 + random.nextInt(9000)}";
    print("to ${dialCode}${mobileController.text}");
    print("otp= $otp");
    final response = await LoginApi.sendOtp(
        to: "${dialCode}${mobileController.text}", otp: otp);
    print("response= $response");
  }

  changeShowPass() {
    showPass = !showPass;
    update();
  }

  void startTimer() {
    if (timer != null) {
      timer!.cancel();
      start = 30;
    }
    update();
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
        update();
      },
    );
  }

  changeSelectedDialCode(String code) {
    dialCode = code;
    update();
  }

  onChangeEmail(String? txt) {
    if ((txt?.length ?? 0) > 1) {
      stopSendBtn = false;
      update();
    }
  }

  changehidePass() {
    hidePass = !hidePass;
    update();
  }

  bool stopVerfyBTN() {
    return start == 0 ||
        fieldOne.text.isEmpty ||
        fieldTwo.text.isEmpty ||
        fieldThree.text.isEmpty ||
        fieldFour.text.isEmpty;
  }

  checkOtpValidate() {
    String inputOtp =
        fieldOne.text + fieldTwo.text + fieldThree.text + fieldFour.text;
    print("inputOtp $inputOtp");
    if (otp == inputOtp) {
      isOtpCorrect = true;
      errorOtp = "";
      update();
    }
  }

  changeErrorMsg(String error) {
    errorOtp = error;
    update();
  }
}
