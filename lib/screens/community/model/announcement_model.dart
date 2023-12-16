class AnnouncementModel {
  String? location;
  String? compoundValue;
  String? name;
  String? description;
  String? picture;
  String? pictureName;
  String? id;
  String? date;

  AnnouncementModel({
    this.location,
    this.compoundValue,
    this.name,
    this.description,
    this.picture,
    this.pictureName,
    this.id,
    this.date,
  });

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    location = json['com_location'];
    compoundValue = json['_com_compound_value'];
    name = json['com_name'];
    description = json['com_description'];
    picture = json['com_newspicture'];
    pictureName = json['com_newspicture_name'];
    id = json['com_updateid'];
    date = json['com_newsdateandtime'];
  }
}
