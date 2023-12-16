import 'package:get/get.dart';
import '../../../../repository/terms_repository.dart';
import '../model/terms_model.dart';

class TermsOfUseCtrl extends GetxController {
  bool loadingData = true;
  List<TermsModel> terms = [];

  @override
  void onInit() {
    super.onInit();
    getTermsOfUse();
  }

  getTermsOfUse() async {
    terms = [];
    changeLoading(true);
    final response = await TermsApi.getTermsRequest();
    if (response.errorFlag == false) {
      for (var term in response.values['value']) {
        terms.add(TermsModel.fromJson(term));
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
