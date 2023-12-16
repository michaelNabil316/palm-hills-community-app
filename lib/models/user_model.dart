class UserModel {
  String? timezoneruleversionnumberOData;
  int? timezoneruleversionnumber;
  String? owningbusinessunitValue;
  String? sOwningbusinessunitValuename;
  String? sOwningbusinessunitValue;
  String? nationalid;
  String? name;
  String? password;
  String? statecodeValue;
  int? statecode;
  String? relationshipValue;
  int? relationship;
  String? statuscodeODataCommunityValue;
  int? statuscode;
  String? maritalstatusValue;
  int? maritalstatus;
  String? birthdateValue;
  String? birthdate;
  String? email;
  String? owneridValueValue;
  String? owneridValueproperty;
  String? owneridValuename;
  String? owneridValue;
  String? id;
  String? owninguserValuename;
  String? owninguserValue;
  String? mobilenumber;
  String? versionnumberValue;
  int? versionnumber;
  String? typeValue;
  int? type;
  // Null? utcconversiontimezonecode;
  // Null? nModifiedonbehalfbyValue;
  // Null? comTenancyenddate;
  // Null? nComRelatedownerValue;
  // Null? overriddencreatedon;
  // Null? nOwningteamValue;
  // Null? nCreatedonbehalfbyValue;
  // Null? nComRelatedaccountValue;
  // Null? comOtp;
  // Null? comTenancystartdate;
  // Null? importsequencenumber;

  UserModel({
    this.timezoneruleversionnumberOData,
    this.timezoneruleversionnumber,
    this.owningbusinessunitValue,
    this.sOwningbusinessunitValuename,
    this.sOwningbusinessunitValue,
    this.nationalid,
    this.name,
    this.password,
    this.statecodeValue,
    this.statecode,
    this.relationshipValue,
    this.relationship,
    this.statuscodeODataCommunityValue,
    this.statuscode,
    this.maritalstatusValue,
    this.maritalstatus,
    this.birthdateValue,
    this.birthdate,
    this.email,
    this.owneridValueValue,
    this.owneridValueproperty,
    this.owneridValuename,
    this.owneridValue,
    this.id,
    this.owninguserValuename,
    this.owninguserValue,
    this.mobilenumber,
    this.versionnumberValue,
    this.versionnumber,
    this.typeValue,
    this.type,
    // this.utcconversiontimezonecode,
    // this.nModifiedonbehalfbyValue,
    // this.comTenancyenddate,
    // this.nComRelatedownerValue,
    // this.overriddencreatedon,
    // this.nOwningteamValue,
    // this.nCreatedonbehalfbyValue,
    // this.nComRelatedaccountValue,
    // this.comOtp,
    // this.comTenancystartdate,
    // this.importsequencenumber
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    timezoneruleversionnumberOData = json[
        'timezoneruleversionnumber@OData.Community.Display.V1.FormattedValue'];
    timezoneruleversionnumber = json['timezoneruleversionnumber'];
    owningbusinessunitValue = json[
        '_owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty'];
    sOwningbusinessunitValuename = json[
        '_owningbusinessunit_value@Microsoft.Dynamics.CRM.lookuplogicalname'];
    sOwningbusinessunitValue = json['_owningbusinessunit_value'];
    nationalid = json['com_nationalid'];
    name = json['com_name'];
    password = json['com_password'];
    statecodeValue =
        json['statecode@OData.Community.Display.V1.FormattedValue'];
    statecode = json['statecode'];
    relationshipValue =
        json['com_relationship@OData.Community.Display.V1.FormattedValue'];
    relationship = json['com_relationship'];
    statuscodeODataCommunityValue =
        json['statuscode@OData.Community.Display.V1.FormattedValue'];
    statuscode = json['statuscode'];
    maritalstatusValue =
        json['com_maritalstatus@OData.Community.Display.V1.FormattedValue'];
    maritalstatus = json['com_maritalstatus'];
    birthdateValue =
        json['com_birthdate@OData.Community.Display.V1.FormattedValue'];
    birthdate = json['com_birthdate'];
    email = json['com_email'];
    owneridValueValue =
        json['_ownerid_value@OData.Community.Display.V1.FormattedValue'];
    owneridValueproperty = json[
        '_ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty'];
    owneridValuename =
        json['_ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname'];
    owneridValue = json['_ownerid_value'];
    id = json['com_userid'];
    owninguserValuename =
        json['_owninguser_value@Microsoft.Dynamics.CRM.lookuplogicalname'];
    owninguserValue = json['_owninguser_value'];
    mobilenumber = json['com_mobilenumber'];
    versionnumberValue =
        json['versionnumber@OData.Community.Display.V1.FormattedValue'];
    versionnumber = json['versionnumber'];
    typeValue = json['com_type@OData.Community.Display.V1.FormattedValue'];
    type = json['com_type'];
    // utcconversiontimezonecode = json['utcconversiontimezonecode'];
    // nModifiedonbehalfbyValue = json['_modifiedonbehalfby_value'];
    // comTenancyenddate = json['com_tenancyenddate'];
    // nComRelatedownerValue = json['_com_relatedowner_value'];
    // overriddencreatedon = json['overriddencreatedon'];
    // nOwningteamValue = json['_owningteam_value'];
    // nCreatedonbehalfbyValue = json['_createdonbehalfby_value'];
    // nComRelatedaccountValue = json['_com_relatedaccount_value'];
    // comOtp = json['com_otp'];
    // comTenancystartdate = json['com_tenancystartdate'];
    // importsequencenumber = json['importsequencenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timezoneruleversionnumber@OData.Community.Display.V1.FormattedValue'] =
        this.timezoneruleversionnumberOData;
    data['timezoneruleversionnumber'] = this.timezoneruleversionnumber;
    data['_owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty'] =
        this.owningbusinessunitValue;
    data['_owningbusinessunit_value@Microsoft.Dynamics.CRM.lookuplogicalname'] =
        this.sOwningbusinessunitValuename;
    data['_owningbusinessunit_value'] = this.sOwningbusinessunitValue;
    data['com_nationalid'] = this.nationalid;
    data['com_name'] = this.name;
    data['com_password'] = this.password;
    data['statecode@OData.Community.Display.V1.FormattedValue'] =
        this.statecodeValue;
    data['statecode'] = this.statecode;
    data['com_relationship@OData.Community.Display.V1.FormattedValue'] =
        this.relationshipValue;
    data['com_relationship'] = this.relationship;
    data['statuscode@OData.Community.Display.V1.FormattedValue'] =
        this.statuscodeODataCommunityValue;
    data['statuscode'] = this.statuscode;
    data['com_maritalstatus@OData.Community.Display.V1.FormattedValue'] =
        this.maritalstatusValue;
    data['com_maritalstatus'] = this.maritalstatus;
    data['com_birthdate@OData.Community.Display.V1.FormattedValue'] =
        this.birthdateValue;
    data['com_birthdate'] = this.birthdate;
    data['com_email'] = this.email;
    data['_ownerid_value@OData.Community.Display.V1.FormattedValue'] =
        this.owneridValueValue;
    data['_ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty'] =
        this.owneridValueproperty;
    data['_ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname'] =
        this.owneridValuename;
    data['_ownerid_value'] = this.owneridValue;
    data['com_userid'] = this.id;
    data['_owninguser_value@Microsoft.Dynamics.CRM.lookuplogicalname'] =
        this.owninguserValuename;
    data['_owninguser_value'] = this.owninguserValue;
    data['com_mobilenumber'] = this.mobilenumber;
    data['versionnumber@OData.Community.Display.V1.FormattedValue'] =
        this.versionnumberValue;
    data['versionnumber'] = this.versionnumber;
    data['com_type@OData.Community.Display.V1.FormattedValue'] = this.typeValue;
    data['com_type'] = this.type;
    // data['utcconversiontimezonecode'] = this.utcconversiontimezonecode;
    // data['_modifiedonbehalfby_value'] = this.nModifiedonbehalfbyValue;
    // data['com_tenancyenddate'] = this.comTenancyenddate;
    // data['_com_relatedowner_value'] = this.nComRelatedownerValue;
    // data['overriddencreatedon'] = this.overriddencreatedon;
    // data['_owningteam_value'] = this.nOwningteamValue;
    // data['_createdonbehalfby_value'] = this.nCreatedonbehalfbyValue;
    // data['_com_relatedaccount_value'] = this.nComRelatedaccountValue;
    // data['com_otp'] = this.comOtp;
    // data['com_tenancystartdate'] = this.comTenancystartdate;
    // data['importsequencenumber'] = this.importsequencenumber;
    return data;
  }
}
