import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/send_message_repository.dart';
import '../../../user_data.dart';
import '../widgets/dialog_submitted_success.dart';

class SalesInquiryCtrl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  bool hidePass = true;
  String selectedCompound = "Select Compound *";
  int selectedCompoundIndex = -1;
  int charachters = 0;

  bool readOnly = true;
  @override
  void onInit() {
    super.onInit();
    fillData();
    readOnly = userGeneralData != null ? false : true;
  }

  Future sendUsAMsg(context) async {
    await Future.delayed(Duration(seconds: 1));
    final response = await SendUsMessageApi.sendMessage(
      name: nameController.text,
      compoundName: selectedCompound,
      phone: phoneController.text,
      message: msgController.text,
    );
    if (response.errorFlag == false) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SubmittedSuccessDialog(
            text: "You submitted your sales inquiry successfully",
          );
        },
      );
    }
  }

  bool HideBtn() {
    if (msgController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        selectedCompoundIndex != -1) {
      return false;
    }
    return true;
  }

  onChangeRelationIndex(index) {
    selectedCompoundIndex = index;
    selectedCompound = appCompounds[index].comName ?? "Select Compound *";
    update();
  }

  fillData() {
    if (userGeneralData != null) {
      readOnly = true;
      nameController.text = userGeneralData!.name ?? "Empty";
      phoneController.text = userGeneralData!.mobilenumber ?? "Empty";
      emailController.text = userGeneralData!.email ?? "Empty";
    } else {
      readOnly = false;
    }
    update();
  }

  changeCharachtersCounter(String v) {
    charachters = v.length;
    update();
  }
}
