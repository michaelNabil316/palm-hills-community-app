import 'package:get/get.dart';

class NotificationCtrl extends GetxController {
  bool isLoading = true;
  List notifications = [];
  Future getNotifications(context) async {
    // final response =
    //     await LoginApi.changePasswordRequest(password: newPassController.text);
    // //print("response>> ${response.values}");
    // if (response.errorFlag == false) {
    //   if (response.values != null) {
    //     setUserData(UserModel.fromJson(response.values));
    //   }
    //   showCustomSnackbar(
    //       context: context,
    //       isSuccessBar: true,
    //       message: "You have successfully changed password");
    //   Navigator.pop(context);
    // }
  }
}
