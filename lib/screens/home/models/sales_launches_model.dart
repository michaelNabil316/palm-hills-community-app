class SalesLaunchesModel {
  String? location;
  String? compoundID;
  String? compoundName;
  String? name;
  String? description;
  String? id;

  SalesLaunchesModel(
      {this.location,
      this.compoundID,
      this.compoundName,
      this.name,
      this.description,
      this.id});

  SalesLaunchesModel.fromJson(Map<String, dynamic> json) {
    location = json['com_location'];
    compoundName =
        json['_com_compound_value@OData.Community.Display.V1.FormattedValue'];
    compoundID = json['_com_compound_value'];
    name = json['com_name'];
    description = json['com_description'];
    id = json['com_updateid'];
  }
}
