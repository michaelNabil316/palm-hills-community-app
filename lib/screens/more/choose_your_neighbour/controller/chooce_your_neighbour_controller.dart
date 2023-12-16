import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/choose_neighbour_repository.dart';
import '../../../../shared_components/snack_bar.dart';

class ChooseYourNeighbourCtrl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  final chooceFormKey = GlobalKey<FormState>();
  bool hideBtn = true;
  int msgCounter = 0;

  Future postRequest(context) async {
    final response = await ChooseneighbourApi.postNewRequest(
      name: nameController.text,
      phone: phoneController.text,
      note: msgController.text,
    );
    print("response>> ${response.errorFlag}");
    if (response.errorFlag == false) {
      showCustomSnackbar(
          context: context,
          isSuccessBar: true,
          message: "You have successfully changed password");
      Navigator.pop(context);
    }
  }

  changeValidForm() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        msgController.text.isNotEmpty) {
      hideBtn = false;
    } else {
      hideBtn = true;
    }
    update();
  }

  changeMsgCounter(v) {
    msgCounter = v.length;
    update();
  }
}
