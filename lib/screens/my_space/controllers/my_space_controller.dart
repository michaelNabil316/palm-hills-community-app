import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/repository/units_repositry.dart';
import '../../../helper/constants.dart';
import '../../../repository/gate_passes_repository.dart';
import '../../../shared_components/snack_bar.dart';
import '../model/gate_pass_model.dart';
import '../model/unit_model.dart';

class MySpaceController extends GetxController {
  final TextEditingController tenantFullName = TextEditingController();
  final TextEditingController tenantMobile = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final TextEditingController newPassDate = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController newPassStartDateController =
      TextEditingController();
  final TextEditingController newPassEndDateController =
      TextEditingController();
  final TextEditingController guestNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  List tenantChilderList = [];
  FocusNode startDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();
  String tenantSelectedUnitName = "Select Unit*";
  DateTime selectedMonth = DateTime.now();
  DateTime selectedday = DateTime.now();
  int selectedIndex = 0;
  String selectedUnitName = "";
  String tenancyPeriodTxt = "Tenancy Period *";
  List<GatePassModel> uiList = [];
  List<GatePassModel> guestList = [];
  List<GatePassModel> driverList = [];
  List<GatePassModel> familyList = [];
  DateTime entryDate = DateTime.now();
  DateTime? endDate;
  int selectedPassTypeIndex = -1;
  int selectedGatePassType = 0;
  int selectedTenantMarriage = -1;
  int tenantChildernNo = 0;
  int tenantSelectedUnitIndex = -1;
  bool loadingData = true;
  int selectedGuestTypeIndex = -1;
  int selectedGuestPassTypeValue = 0;

  List passTypes = [
    {"name": "Gate Pass", "value": 181410000},
    {"name": "Beach Pass", "value": 181410001},
  ];
  List guestTypes = [
    {"name": "Guest", "value": 181410000},
    {"name": "Driver/Help", "value": 181410002},
    {"name": "Family", "value": 181410001},
  ];
  final myTabs = ["Guest ", "Driver/Help", "Family"];
  List<UnitModel> myUnits = [];

  @override
  void onInit() {
    super.onInit();
    getAllMyUnites();
    getGatePasses();
  }

  createGatePass(context) async {
    changeLoading(true);
    final response = await GatePassesApi.createNewGatePass(
      name: guestNameController.text,
      passType: selectedGatePassType,
      guestType: selectedGuestPassTypeValue,
      entryDate: entryDate,
      endDate: endDate,
    );
    if (response.errorFlag == false) {
      showCustomSnackbar(
          context: context,
          isSuccessBar: true,
          message: "You have successfully add Gate Pass");
      clearGeneralPageData();
      getGatePasses();
      Navigator.pop(context);
    } else {
      showCustomSnackbar(
          context: context,
          isSuccessBar: false,
          message: "error while creating new Gate Pass");
    }
    changeLoading(false);
  }
//unit {@odata.etag: W/"7994976", _com_relatedowner_value@OData.Community.Display.V1.FormattedValue: Michael Nabil, _com_relatedowner_value@Microsoft.Dynamics.CRM.associatednavigationproperty: com_RelatedOwner, _com_relatedowner_value@Microsoft.Dynamics.CRM.lookuplogicalname: com_user, _com_relatedowner_value: d00b6d8f-fa77-ee11-93e6-6045bd0f6dd1, com_entrydate@OData.Community.Display.V1.FormattedValue: 12/7/2023 2:14 PM, com_entrydate: 2023-12-07T11:14:52Z, _owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty: owningbusinessunit, _owningbusinessunit_value@Microsoft.Dynamics.CRM.lookuplogicalname: businessunit, _owningbusinessunit_value: c7e73bb4-5dcd-ed11-93d1-6045bd0f6dd1, com_name: driver test t, _ownerid_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty: ownerid, _ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _ownerid_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, statuscode@OData.Community.Display.V1.FormattedValue: Inactive, statuscode: 2, _createdby_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _createdby_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _createdby_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, com_guesttype@OData.Community.Display.V1.FormattedValue: Driver/Help, com_guesttype: 181410002, timezoneruleversionnumber@OData.Community.Display.V1.FormattedValue: 0, timezoneruleversionnumber: 0, com_gatepassid: b214ce8e-e194-ee11-93e8-6045bd0f6dd1, createdon@OData.Community.Display.V1.FormattedValue: 12/7/2023 12:18 PM, createdon: 2023-12-07T09:18:18Z, _owninguser_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _owninguser_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, _modifiedby_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _modifiedby_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _modifiedby_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, versionnumber@OData.Community.Display.V1.FormattedValue: 7,994,976, versionnumber: 7994976, com_type@OData.Community.Display.V1.FormattedValue: Beach Pass, com_type: 181410001, modifiedon@OData.Community.Display.V1.FormattedValue: 12/7/2023 1:42 PM, modifiedon: 2023-12-07T10:42:28Z, statecode@OData.Community.Display.V1.FormattedValue: Inactive, statecode: 1, _modifiedonbehalfby_value: null, _createdonbehalfby_value: null, _owningteam_value: null, com_driveridpictureback: null, com_driveridpicturefront: null, com_passcode: null, com_driveridpictureback_name: null, com_passcode_name: null, importsequencenumber: null, com_driveridpicturefront_name: null, com_enddate@OData.Community.Display.V1.FormattedValue: 12/8/2023 3:00 AM, com_enddate: 2023-12-08T00:00:00Z, utcconversiontimezonecode: null, overriddencreatedon: null}
//{@odata.etag: W/"7994487", _com_relatedowner_value@OData.Community.Display.V1.FormattedValue: Michael Nabil, _com_relatedowner_value@Microsoft.Dynamics.CRM.associatednavigationproperty: com_RelatedOwner, _com_relatedowner_value@Microsoft.Dynamics.CRM.lookuplogicalname: com_user, _com_relatedowner_value: d00b6d8f-fa77-ee11-93e6-6045bd0f6dd1, com_entrydate@OData.Community.Display.V1.FormattedValue: 12/6/2023 3:00 AM, com_entrydate: 2023-12-06T00:00:00Z, _owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty: owningbusinessunit, _owningbusinessunit_value@Microsoft.Dynamics.CRM.lookuplogicalname: businessunit, _owningbusinessunit_value: c7e73bb4-5dcd-ed11-93d1-6045bd0f6dd1, com_name: family test, _ownerid_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty: ownerid, _ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _ownerid_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, statuscode@OData.Community.Display.V1.FormattedValue: Active, statuscode: 1, _createdby_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _createdby_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _createdby_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, com_guesttype@OData.Community.Display.V1.FormattedValue: Family, com_guesttype: 181410001, timezoneruleversionnumber@OData.Community.Display.V1.FormattedValue: 0, timezoneruleversionnumber: 0, com_gatepassid: bc653f4c-3594-ee11-93e8-6045bd0f6dd1, createdon@OData.Community.Display.V1.FormattedValue: 12/6/2023 3:45 PM, createdon: 2023-12-06T12:45:13Z, _owninguser_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _owninguser_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, _modifiedby_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _modifiedby_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _modifiedby_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, versionnumber@OData.Community.Display.V1.FormattedValue: 7,994,487, versionnumber: 7994487, com_type@OData.Community.Display.V1.FormattedValue: Gate Pass, com_type: 181410000, modifiedon@OData.Community.Display.V1.FormattedValue: 12/7/2023 12:38 PM, modifiedon: 2023-12-07T09:38:41Z, statecode@OData.Community.Display.V1.FormattedValue: Active, statecode: 0, _modifiedonbehalfby_value: null, _createdonbehalfby_value: null, _owningteam_value: null, com_driveridpictureback: null, com_driveridpicturefront: null, com_passcode: null, com_driveridpictureback_name: null, com_passcode_name: null, importsequencenumber: null, com_driveridpicturefront_name: null, com_enddate: null, utcconversiontimezonecode: null, overriddencreatedon: null}
//{@odata.etag: W/"7994413", _com_relatedowner_value@OData.Community.Display.V1.FormattedValue: Michael Nabil, _com_relatedowner_value@Microsoft.Dynamics.CRM.associatednavigationproperty: com_RelatedOwner, _com_relatedowner_value@Microsoft.Dynamics.CRM.lookuplogicalname: com_user, _com_relatedowner_value: d00b6d8f-fa77-ee11-93e6-6045bd0f6dd1, com_entrydate@OData.Community.Display.V1.FormattedValue: 11/23/2023 12:00 AM, com_entrydate: 2023-11-22T21:00:00Z, _owningbusinessunit_value@Microsoft.Dynamics.CRM.associatednavigationproperty: owningbusinessunit, _owningbusinessunit_value@Microsoft.Dynamics.CRM.lookuplogicalname: businessunit, _owningbusinessunit_value: c7e73bb4-5dcd-ed11-93d1-6045bd0f6dd1, com_name: nour mohamed, _ownerid_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty: ownerid, _ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _ownerid_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, statuscode@OData.Community.Display.V1.FormattedValue: Active, statuscode: 1, _createdby_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _createdby_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _createdby_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, com_guesttype@OData.Community.Display.V1.FormattedValue: Family, com_guesttype: 181410001, timezoneruleversionnumber@OData.Community.Display.V1.FormattedValue: 0, timezoneruleversionnumber: 0, com_gatepassid: d7fb11ba-2d89-ee11-93e7-6045bd0f6dd1, createdon@OData.Community.Display.V1.FormattedValue: 11/22/2023 2:53 PM, createdon: 2023-11-22T11:53:19Z, _owninguser_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _owninguser_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, _modifiedby_value@OData.Community.Display.V1.FormattedValue: Initium Dev, _modifiedby_value@Microsoft.Dynamics.CRM.lookuplogicalname: systemuser, _modifiedby_value: 71df0e6a-8dcd-ed11-93d1-6045bd0f6dd1, versionnumber@OData.Community.Display.V1.FormattedValue: 7,994,413, versionnumber: 7994413, com_type@OData.Community.Display.V1.FormattedValue: Beach Pass, com_type: 181410001, modifiedon@OData.Community.Display.V1.FormattedValue: 12/7/2023 12:37 PM, modifiedon: 2023-12-07T09:37:27Z, statecode@OData.Community.Display.V1.FormattedValue: Active, statecode: 0, _modifiedonbehalfby_value: null, _createdonbehalfby_value: null, _owningteam_value: null, com_driveridpictureback: null, com_driveridpicturefront: null, com_passcode: null, com_driveridpictureback_name: null, com_passcode_name: null, importsequencenumber: null, com_driveridpicturefront_name: null, com_enddate: null, utcconversiontimezonecode: null, overriddencreatedon: null}

  getGatePasses() async {
    uiList.clear();
    guestList.clear();
    driverList.clear();
    familyList.clear();
    selectedIndex = 0;
    changeLoading(true);
    final response = await GatePassesApi.getMyGatePasses();
    if (response.errorFlag == false) {
      for (var unit in response.values['value']) {
        // log("unit $unit");
        GatePassModel formatedUnit = GatePassModel.fromJson(unit);
        if (formatedUnit.guestTypeId == 181410000) {
          guestList.add(formatedUnit);
        } else if (formatedUnit.guestTypeId == 181410001) {
          familyList.add(formatedUnit);
        } else if (formatedUnit.guestTypeId == 181410002) {
          driverList.add(formatedUnit);
        }
      }
    }
    uiList = [...guestList];
    changeLoading(false);
  }

  changeGatePassStatus({required String id, required bool value}) async {
    changeLoading(true);
    await GatePassesApi.changeStatusRequest(id: id, value: value);
    getGatePasses();
  }

  getAllMyUnites() async {
    myUnits = [];
    final response = await UnitApi.getAllMyUnites();
    if (response.errorFlag == false) {
      for (var unit in response.values['value']) {
        myUnits.add(UnitModel.fromJson(unit));
      }
    }
    update();
  }

  void changeTab(int index) {
    selectedIndex = index;

    uiList.clear();
    switch (index) {
      case 0:
        uiList = [...guestList];
      case 1:
        uiList = [...driverList];
      case 2:
        uiList = [...familyList];
    }
    update();
  }

  deletePass(id) async {
    changeLoading(true);
    final response = await GatePassesApi.deletePassRequest(id: id);
    if (response.errorFlag == false) {
      await getGatePasses();
    }
    changeLoading(false);
  }

  changeSelectedUnitName(String name) {
    selectedUnitName = name;
    update();
  }

  openBottomSheet(context, Widget widget) {
    showModalBottomSheet<void>(
      isScrollControlled: true, //set true
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  String handleSelectedMonth() {
    return "${monthNameFromNumber(selectedMonth.month)} ${selectedMonth.year}";
  }

  changeSelectedDate(bool state) {
    selectedMonth = state
        ? DateTime(
            selectedMonth.year, selectedMonth.month + 1, selectedMonth.day)
        : DateTime(
            selectedMonth.year, selectedMonth.month - 1, selectedMonth.day);
    update();
  }

  changeSelectedDay(DateTime date) {
    selectedday = date;
    String handleDate = "${date.day}/${date.month}/${date.year}";
    if (startDateFocusNode.hasFocus) {
      startDateController.text = handleDate;
      endDateFocusNode.requestFocus();
    }
    if (endDateFocusNode.hasFocus) {
      endDateController.text = handleDate;
    }
    handleTenancyPeriodTxt();
    update();
  }

  changeNewPassSelectedDay(DateTime date) {
    selectedday = date;
    String handleDate = "${date.day}/${date.month}/${date.year}";
    if (startDateFocusNode.hasFocus) {
      newPassStartDateController.text = handleDate;
      endDateFocusNode.requestFocus();
    }
    if (endDateFocusNode.hasFocus) {
      endDate = date;
      newPassEndDateController.text = handleDate;
    }
    handleNewPassPeriodTxt();
    update();
  }

  changeSelectedPassType(i) {
    selectedPassTypeIndex = i;
    selectedGatePassType = passTypes[i]['value'];
    update();
  }

  changeSelectedGuestType(i) {
    print("i >> $i");
    selectedGuestTypeIndex = i;
    selectedGuestPassTypeValue = guestTypes[i]['value'];
    print("guestTypes[i]['value'] >> ${guestTypes[i]['value']}");
    update();
  }

  changeBirthDate(DateTime? date) {
    if (date != null) {
      entryDate = date;
      dateOfBirthController.text = "${date.day}/${date.month}/${date.year}";
    }
    update();
  }

  bool stopSharePassBtn() {
    if (selectedGuestTypeIndex != 2) {
      return selectedPassTypeIndex == -1 ||
          guestNameController.text.isEmpty ||
          dateOfBirthController.text.isEmpty;
    } else {
      return selectedPassTypeIndex == -1 ||
          guestNameController.text.isEmpty ||
          newPassDate.text.isEmpty;
    }
  }

  handleTenancyPeriodTxt() {
    String startTxt = startDateController.text.isEmpty
        ? "(Start Date)"
        : startDateController.text;
    String endTxt =
        endDateController.text.isEmpty ? "(End Date)" : endDateController.text;
    birthDate.text = "$startTxt - $endTxt";
  }

  handleNewPassPeriodTxt() {
    String startTxt = newPassStartDateController.text.isEmpty
        ? "(Start Date)"
        : newPassStartDateController.text;
    String endTxt = newPassEndDateController.text.isEmpty
        ? "(End Date)"
        : newPassEndDateController.text;
    newPassDate.text = "$startTxt - $endTxt";
  }

  changeSelectedTenantMarriage(int i) {
    selectedTenantMarriage = i;
    update();
  }

  changeTenantChildernNo(bool isPlus) {
    if (isPlus) {
      tenantChildernNo++;
      tenantChilderList.add(TextEditingController());
    } else {
      if (tenantChildernNo > 0) {
        tenantChildernNo--;
        tenantChilderList.removeAt(tenantChilderList.length - 1);
      }
    }
    update();
  }

  clearSelectedUnitName() {
    selectedUnitName = "";
  }

  onChangeTenantUnitIndex(int index, String? name) {
    tenantSelectedUnitName = name ?? "Select Relationship *";
    tenantSelectedUnitIndex = index;
    update();
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }

  String myUnitsSubTile() {
    String txt = "";
    for (var u in myUnits) {
      txt += "${u.comName} ";
    }
    return txt;
  }

  updating() {
    update();
  }

  clearGeneralPageData() {
    guestNameController.clear();
    newPassEndDateController.clear();
    newPassStartDateController.clear();
    newPassDate.clear();
    entryDate = DateTime.now();
    dateOfBirthController.clear();
    selectedPassTypeIndex = -1;
    selectedGuestTypeIndex = -1;
    tenancyPeriodTxt = "Tenancy Period *";
  }
}
