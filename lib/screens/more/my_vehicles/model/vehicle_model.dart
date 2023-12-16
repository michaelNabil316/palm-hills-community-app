class VehiclesModel {
  String? relatedownerValue;
  String? year;
  String? makeName;
  int? statuscode;
  String? model;
  String? id;
  String? carlicensePictureName;
  String? carlicensepictureID;
  String? paletteText;

  VehiclesModel(
      {this.relatedownerValue,
      this.year,
      this.makeName,
      this.statuscode,
      this.model,
      this.id,
      this.carlicensePictureName,
      this.carlicensepictureID,
      this.paletteText});

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    relatedownerValue = json[
        '_com_relatedowner_value@OData.Community.Display.V1.FormattedValue'];
    year = json['com_year'];
    makeName = json['com_name'];
    statuscode = json['statuscode'];
    model = json['com_model'];
    id = json['com_vehicleid'];
    carlicensePictureName = json['com_carlicensepicture_name'];
    carlicensepictureID = json['com_carlicensepicture'];
    paletteText = json['com_palettecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_com_relatedowner_value'] = this.relatedownerValue;
    data['com_year'] = this.year;
    data['com_name'] = this.makeName;
    data['statuscode'] = this.statuscode;
    data['com_model'] = this.model;
    data['com_vehicleid'] = this.id;
    data['com_carlicensepicture_name'] = this.carlicensePictureName;
    data['com_carlicensepicture'] = this.carlicensepictureID;
    data['com_palettecode'] = this.paletteText;
    return data;
  }
}
/*

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    relatedOwner = json[
        '_com_relatedowner_value@OData.Community.Display.V1.FormattedValue'];
    sComRelatedownerValue = json['_com_relatedowner_value'];
    owningbusinessunit = json[
        '_owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty'];
    sOwningbusinessunitValue = json['_owningbusinessunit_value'];
    comName = json['com_name'];
    statuscode = json['statuscode'];
    comVehicleid = json['com_vehicleid'];
    palettecode = json['com_palettecode'];
  }

*/