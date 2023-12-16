import 'package:get/get.dart';

class SettingCtrl extends GetxController {
  bool pushNotificationSwitcher = true;
  bool emailNotificationSwitcher = false;
  int selectedLangIndex = 0;
  List langs = ["English", "العربية"];

  changePushNotificationSwitcher(value) {
    pushNotificationSwitcher = value;
    update();
  }

  changeEmailNotificationSwitcher(value) {
    emailNotificationSwitcher = value;
    update();
  }

  changeSelectedLang(i) {
    selectedLangIndex = i;
    update();
  }
}
