class CompoundModel {
  String? odataEtag;
  String? comCompoundid;
  String? comName;
  String? sComRelatedprojectValueODataCommunityDisplayV1FormattedValue;
  String?
      sComRelatedprojectValueMicrosoftDynamicsCRMAssociatednavigationproperty;
  String? sComRelatedprojectValueMicrosoftDynamicsCRMLookuplogicalname;
  String? sComRelatedprojectValue;

  CompoundModel(
      {this.odataEtag,
      this.comCompoundid,
      this.comName,
      this.sComRelatedprojectValueODataCommunityDisplayV1FormattedValue,
      this.sComRelatedprojectValueMicrosoftDynamicsCRMAssociatednavigationproperty,
      this.sComRelatedprojectValueMicrosoftDynamicsCRMLookuplogicalname,
      this.sComRelatedprojectValue});

  CompoundModel.fromJson(Map<String, dynamic> json) {
    odataEtag = json['@odata.etag'];
    comCompoundid = json['com_compoundid'];
    comName = json['com_name'];
    sComRelatedprojectValueODataCommunityDisplayV1FormattedValue = json[
        '_com_relatedproject_value@OData.Community.Display.V1.FormattedValue'];
    sComRelatedprojectValueMicrosoftDynamicsCRMAssociatednavigationproperty = json[
        '_com_relatedproject_value@Microsoft.Dynamics.CRM.associatednavigationproperty'];
    sComRelatedprojectValueMicrosoftDynamicsCRMLookuplogicalname = json[
        '_com_relatedproject_value@Microsoft.Dynamics.CRM.lookuplogicalname'];
    sComRelatedprojectValue = json['_com_relatedproject_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['@odata.etag'] = odataEtag;
    data['com_compoundid'] = comCompoundid;
    data['com_name'] = comName;
    data['_com_relatedproject_value@OData.Community.Display.V1.FormattedValue'] =
        sComRelatedprojectValueODataCommunityDisplayV1FormattedValue;
    data['_com_relatedproject_value@Microsoft.Dynamics.CRM.associatednavigationproperty'] =
        sComRelatedprojectValueMicrosoftDynamicsCRMAssociatednavigationproperty;
    data['_com_relatedproject_value@Microsoft.Dynamics.CRM.lookuplogicalname'] =
        sComRelatedprojectValueMicrosoftDynamicsCRMLookuplogicalname;
    data['_com_relatedproject_value'] = sComRelatedprojectValue;
    return data;
  }
}
