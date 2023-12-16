import 'package:get/get.dart';
import '../../../../repository/terms_repository.dart';
import '../model/privacy_model.dart';

class PrivacyCtrl extends GetxController {
  bool loadingData = true;
  List<PrivacyModel> dataList = [];

  @override
  void onInit() {
    super.onInit();
    getPrivacyPolices();
  }

  getPrivacyPolices() async {
    dataList = [];
    changeLoading(true);
    final response = await TermsApi.getTermsRequest(type: "181410000");
    if (response.errorFlag == false) {
      for (var term in response.values['value']) {
        dataList.add(PrivacyModel.fromJson(term));
      }
    }
    changeLoading(false);
    update();
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }
}
