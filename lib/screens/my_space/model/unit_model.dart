class UnitModel {
  String? comName;
  String? sComOwninguserValue;
  String? comUnitid;
  String? statuscodename;
  int? statuscode;
  String? relatedunitValue;
  String? sComRelatedunitValue;
  String? sOwneridValue;
  String? compound;
  String? compoundValue;
  String? createdon;
  String? statecodeValue;
  String? relatedunitPlace;
  int? statecode;

  UnitModel(
      {this.comName,
      this.sComOwninguserValue,
      this.comUnitid,
      this.statuscodename,
      this.statuscode,
      this.relatedunitValue,
      this.sComRelatedunitValue,
      this.sOwneridValue,
      this.compound,
      this.compoundValue,
      this.createdon,
      this.statecodeValue,
      this.relatedunitPlace,
      this.statecode});

  UnitModel.fromJson(Map<String, dynamic> json) {
    comName = json['com_name'];
    sComOwninguserValue =
        json['_com_owninguser_value@OData.Community.Display.V1.FormattedValue'];
    comUnitid = json['com_unitid'];
    statuscodename =
        json['statuscode@OData.Community.Display.V1.FormattedValue'];
    statuscode = json['statuscode'];
    relatedunitValue = json[
        '_com_relatedunit_value@OData.Community.Display.V1.FormattedValue'];
    sComRelatedunitValue = json['_com_relatedunit_value'];
    sOwneridValue = json['_ownerid_value'];
    compound =
        json['_com_compound_value@OData.Community.Display.V1.FormattedValue'];
    compoundValue = json['_com_compound_value'];
    createdon = json['createdon'];
    statecodeValue =
        json['statecode@OData.Community.Display.V1.FormattedValue'];
    statecode = json['statecode'];
    relatedunitPlace = json['com_RelatedUnit'] != null
        ? json['com_RelatedUnit']
            ['_blser_region_value@OData.Community.Display.V1.FormattedValue']
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['com_name'] = comName;
    data['_com_owninguser_value@OData.Community.Display.V1.FormattedValue'] =
        sComOwninguserValue;
    data['com_unitid'] = comUnitid;
    data['statuscode@OData.Community.Display.V1.FormattedValue'] =
        statuscodename;
    data['statuscode'] = statuscode;
    data['_com_relatedunit_value@OData.Community.Display.V1.FormattedValue'] =
        relatedunitValue;
    data['_com_relatedunit_value'] = sComRelatedunitValue;
    data['_ownerid_value'] = sOwneridValue;
    data['_com_compound_value@OData.Community.Display.V1.FormattedValue'] =
        compound;
    data['_com_compound_value'] = compoundValue;
    data['createdon'] = createdon;
    data['statecode@OData.Community.Display.V1.FormattedValue'] =
        statecodeValue;
    data['statecode'] = statecode;
    return data;
  }
}
