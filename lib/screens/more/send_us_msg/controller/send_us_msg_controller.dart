import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/models/compound_model.dart';
import 'package:palm_hills/screens/user_data.dart';

import '../../../../repository/send_message_repository.dart';
import '../../sales_inquiry/widgets/dialog_submitted_success.dart';

class SendUsAMsgCtrl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  bool hidePass = true;
  bool readOnly = true;
  String selectedMsgTypeName = "Message Type *";
  int selectedRelationIndex = -1;
  int charachters = 0;
  CompoundModel? selectedCompound;
  List msgTypList = [
    "Inquiry",
    "Suggestion",
    "Complaint",
    "Other",
  ];

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
      compoundName: selectedCompound?.comName ?? "",
      phone: phoneController.text,
      message: msgController.text,
    );
    if (response.errorFlag == false) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SubmittedSuccessDialog(
            text: "You submitted your message successfully",
          );
        },
      );
    }
  }

  onChangeRelationIndex(index) {
    selectedRelationIndex = index;
    selectedMsgTypeName = msgTypList[index];
    update();
  }

  onChangeSelectedCompound(index) {
    selectedCompound = appCompounds[index];
    update();
  }

  changeCharachtersCounter(String v) {
    charachters = v.length;
    update();
  }

  bool HideBtn() {
    if (msgController.text.isNotEmpty &&
        selectedRelationIndex != -1 &&
        selectedCompound != null) {
      return false;
    }
    return true;
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
}
