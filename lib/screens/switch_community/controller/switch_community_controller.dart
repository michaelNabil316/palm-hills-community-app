import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user_data.dart';

class SwitchCommunityCtrl extends GetxController {
  int selectedIndex = 0;
  int selectedCommunityIndex = 0;
  String communityName = "";
  final TextEditingController requestNoteController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    communityName = myCompounds.isNotEmpty
        ? myCompounds[0].comName ?? "compound"
        : "Our Compound";
  }

  String selectedNewCompoundName = "Select Compound *";
  int selectedNewCompoundIndex = -1;

  onChangeCompoundIndex(index) {
    selectedNewCompoundIndex = index;
    selectedNewCompoundName = appCompounds[index].comName ?? "compound";
    update();
  }

  changeSelectedCommunity(int index) {
    selectedIndex = index;
    update();
  }

  changeSelectedCommunityBottomSheetIndex(int index) {
    selectedCommunityIndex = index;
    update();
  }

  changeSelectedCommunityBottomSheet() {
    communityName = myCompounds[selectedCommunityIndex].comName ?? "compound";
    update();
  }

  bool isButtonNotActive() {
    return requestNoteController.text.isEmpty || selectedNewCompoundIndex == -1;
  }
}
