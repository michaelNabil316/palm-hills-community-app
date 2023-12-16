class TermsModel {
  String? description;
  String? title;
  String? id;

  TermsModel({this.description, this.title, this.id});

  TermsModel.fromJson(Map<String, dynamic> json) {
    description = json['com_description'];
    title = json['com_name'];
    id = json['com_appsettingsid'];
  }
}
