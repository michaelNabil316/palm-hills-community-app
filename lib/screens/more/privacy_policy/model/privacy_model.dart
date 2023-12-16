class PrivacyModel {
  String? description;
  String? title;
  String? id;

  PrivacyModel({this.description, this.title, this.id});

  PrivacyModel.fromJson(Map<String, dynamic> json) {
    description = json['com_description'];
    title = json['com_name'];
    id = json['com_appsettingsid'];
  }
}
