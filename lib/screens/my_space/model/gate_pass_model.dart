class GatePassModel {
  String? id;
  String? entrydateFormated;
  String? entrydate;
  String? gateUsername;
  String? statecodeValue;
  int? statecode;
  // String? statuscodeValue;
  //int? statuscode;
  String? typeValue;
  int? passTypeId;
  int? guestTypeId;
  String? createdon;
  String? passcode;

  GatePassModel(
      {this.id,
      this.entrydateFormated,
      this.entrydate,
      this.gateUsername,
      this.statecodeValue,
      this.statecode,
      // this.statuscodeValue,
      //this.statuscode,
      this.typeValue,
      this.passTypeId,
      this.guestTypeId,
      this.createdon,
      this.passcode});

  GatePassModel.fromJson(Map<String, dynamic> json) {
    id = json['com_gatepassid'];
    entrydateFormated =
        json['com_entrydate@OData.Community.Display.V1.FormattedValue'];
    entrydate = json['com_entrydate'];
    gateUsername = json['com_name'];
    statecodeValue =
        json['statecode@OData.Community.Display.V1.FormattedValue'];
    statecode = json['statecode'];
    // statuscodeValue =
    //     json['statuscode@OData.Community.Display.V1.FormattedValue'];
    // statuscode = json['statuscode'];
    typeValue = json['com_type@OData.Community.Display.V1.FormattedValue'];
    passTypeId = json['com_type'];
    guestTypeId = json['com_guesttype'];
    createdon = json['createdon'];
    passcode = json['com_passcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com_gatepassid'] = this.id;
    data['com_entrydate@OData.Community.Display.V1.FormattedValue'] =
        this.entrydateFormated;
    data['com_entrydate'] = this.entrydate;
    data['com_name'] = this.gateUsername;
    data['statecode@OData.Community.Display.V1.FormattedValue'] =
        this.statecodeValue;
    data['statecode'] = this.statecode;
    // data['statuscode@OData.Community.Display.V1.FormattedValue'] =
    //     this.statuscodeValue;
    // data['statuscode'] = this.statuscode;
    data['com_type@OData.Community.Display.V1.FormattedValue'] = this.typeValue;
    data['com_type'] = this.passTypeId;
    data['com_guesttype'] = this.guestTypeId;
    data['createdon'] = this.createdon;
    data['com_passcode'] = this.passcode;
    return data;
  }
}
