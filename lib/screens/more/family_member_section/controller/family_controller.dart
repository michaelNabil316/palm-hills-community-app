import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/models/user_model.dart';

import '../../../../repository/family_members_repository.dart';
import '../../../../shared_components/snack_bar.dart';

class FamilyCtrl extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  String selectedRelationName = "Select Relationship *";
  int selectedRelationIndex = -1;
  List requests = [];
  List<UserModel> members = [];
  bool palmSwitcher = true;
  bool hacindaSwitcher = false;
  bool palmSwitcherSendInv = true;
  bool hacindaSwitcherSendInv = false;
  bool palmSwitcherNewMember = false;
  bool hacindaSwitcherNewMember = false;
  bool loadingData = false;

  @override
  void onInit() {
    super.onInit();
    getMyFamilyData();
  }

  getMyFamilyData() async {
    members = [];
    changeLoading(true);
    final response = await FamilyApi.getAllMyFamilyMembers();
    if (response.errorFlag == false) {
      if (response.values != null) {
        for (var v in response.values['value']) {
          members.add(UserModel.fromJson(v));
        }
      }
    }
    changeLoading(false);
  }

  deleteMyFamilyAccount(context, String? id) async {
    if (id != null) {
      changeLoading(true);
      //Navigator.pop(context);
      final response = await FamilyApi.deleteFamilyMembersRequest(id);
      await Future.delayed(Duration(seconds: 2));
      if (response.errorFlag == false) {
        showCustomSnackbar(
            context: context,
            isSuccessBar: true,
            message: "You have successfully deleted account");
        Navigator.pop(context);
        getMyFamilyData();
      } else {
        showCustomSnackbar(
            context: context,
            isSuccessBar: false,
            message: "something went wrong");
      }
      changeLoading(false);
    }
  }

  changePalmSwitcher(value) {
    palmSwitcher = value;
    update();
  }

  changeHacindaSwitcher(value) {
    hacindaSwitcher = value;
    update();
  }

  changePalmSwitcherSendInv(value) {
    palmSwitcherSendInv = value;
    update();
  }

  changeHacindaSwitcherSendInv(value) {
    hacindaSwitcherSendInv = value;
    update();
  }

  changePalmSwitcherNewMember(value) {
    palmSwitcherNewMember = value;
    update();
  }

  changeHacindaSwitcherNewMember(value) {
    hacindaSwitcherNewMember = value;
    update();
  }

  bool isThereChangeHappened() {
    if (palmSwitcherSendInv != true || hacindaSwitcherSendInv != false) {
      return true;
    }
    return false;
  }

  bool isThereChangeHappenedNewMember() {
    if (palmSwitcherNewMember != false || hacindaSwitcherNewMember != false) {
      return true;
    }
    return false;
  }

  bool isThereChangeHappenedInMemberPage() {
    if (palmSwitcher != true || hacindaSwitcher != false) {
      return true;
    }
    return false;
  }

  onChangeRelationIndex(int index, String? name) {
    selectedRelationName = name ?? "Select Relationship *";
    selectedRelationIndex = index;
    update();
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }
}
