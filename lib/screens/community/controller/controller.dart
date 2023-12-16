import 'package:get/get.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../repository/community_repository.dart';
import '../model/announcement_model.dart';

class CommunityCtrl extends GetxController {
  bool loadingData = true;
  List<AnnouncementModel> announcements = [];

  @override
  void onInit() {
    super.onInit();
    getAnnouncements();
  }

  getAnnouncements() async {
    if (userGeneralData != null) {
      announcements = [];
      changeLoading(true);
      final response = await CommunityApi.getAnnouncementsRequest();
      if (response.errorFlag == false) {
        for (var term in response.values['value']) {
          announcements.add(AnnouncementModel.fromJson(term));
        }
      }
      changeLoading(false);
      update();
    }
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }
}
