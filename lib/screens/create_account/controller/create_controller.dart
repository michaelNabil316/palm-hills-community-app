import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../face_detection/camera_screen.dart';
import '../sections/add_details_section.dart';
import '../sections/check_identity_section.dart';
import '../sections/verfiy_number_section.dart';

class CreateAccountCtrl extends GetxController {
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController requestCodeNameCtr = TextEditingController();
  final TextEditingController requestCodeMobileNumberCtr =
      TextEditingController();
  final TextEditingController requestCodeOwnerMobileNOCtr =
      TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var invitationCodeController = TextEditingController();
  var nationalIdController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String? selfieImagePath;

  // List creationRoadMapUi = [];
  int selectedIndex = 0;
  int currentIndex = 0;
  bool hidePass = true;
  String errorMsg = "";
  Timer? timer;
  int start = 30;
  final int seconds = 300;
  final oneSec = const Duration(seconds: 1);
  int selectedRelationIndex = -1;
  String selectedRelationName = "Relationship to Owner *";
  DateTime birthDate = DateTime.now();
  String errorSelfie = "";

  List<Widget> allSections = [AddDetails(), VerfiyNumber(), CheckIdentity()];
  List<Widget> creationSteps = [];

  @override
  void onInit() {
    super.onInit();
    creationSteps = allSections;
  }

  nextSection() {
    currentIndex += 1;
    if (currentIndex == 1) {
      startTimer();
    } else if (currentIndex == 2) {
      timer!.cancel();
    }
    update();
  }

  pressBack() {
    currentIndex -= 1;
    update();
  }

  changeShowPass() {
    hidePass = !hidePass;
    update();
  }

  changeSelectedAccount(int index) {
    selectedIndex = index;
    creationSteps = [...allSections];
    if (index != 0) {
      creationSteps.removeAt(1);
    }
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

  resetCurrentIndex() {
    currentIndex = 0;
    update();
  }

  openBottomSheet(context, Widget widget) {
    showModalBottomSheet<void>(
      isScrollControlled: true, //set true
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  onChangeRelationIndex(int index, String? name) {
    selectedRelationName = name ?? "Relationship to Owner *";
    selectedRelationIndex = index;
    update();
  }

  changeBirthDate(DateTime? date) {
    if (date != null) {
      birthDate = date;
      dateOfBirthController.text = "${date.day}/${date.month}/${date.year}";
    }
    update();
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      await [
        Permission.camera,
        Permission.microphone,
      ].request();
    }
    var status2 = await Permission.camera.status;
    if (status2.isDenied) {
      errorMsg =
          "Oops, your camera access is denied. Please go to the device's settings and enable your camera.";
      update();
      return false;
    }
    errorMsg = "";
    update();
    return true;
  }

  Future<void> navigateAndDisplaySelection(BuildContext context) async {
    //check permission first

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CameraScreen()),
    );
    log("result>>>>>>>>>>>> $result");
    if (result != null) {
      selfieImagePath = result;
    }
    update();
  }

  bool isFamilyMemberblewThan15years() {
    if (selectedIndex == 2) {
      final differenceDays = DateTime.now().difference(birthDate).inDays;
      if ((differenceDays / 365) < 15) {
        return true;
      }
    }
    return false;
  }
}
