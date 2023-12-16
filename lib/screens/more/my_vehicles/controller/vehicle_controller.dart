import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/more/my_vehicles/model/vehicle_model.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../../repository/vehicle_repository.dart';

class VehicleCtrl extends GetxController {
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  String selectedOwnerName = "Select Owner *";
  int selectedOwnerIndex = -1;
  List ownerVehicles = [
    "You (${userGeneralData?.name ?? ""})",
  ];
  List<VehiclesModel> myVehicles = [];
  bool loadingData = true;
  VehiclesModel? editingVehicle;
  String? licenseImage;
  String? errormsg;
  String filterValue = "";

  @override
  void onInit() {
    super.onInit();
    getMyVehiclesAndFamily();
  }

  getMyVehiclesAndFamily() async {
    //as discussed bussiness owner should see his and his family vehicles
    myVehicles = [];
    setFilterValue();
    changeLoading(true);
    final response =
        await VehiclesApi.getAllMyVehicles(filterValue: filterValue);
    if (response.errorFlag == false) {
      if (response.values != null) {
        for (var v in response.values['value']) {
          myVehicles.add(VehiclesModel.fromJson(v));
        }
      }
    }
    changeLoading(false);
  }

  Future addVehicle(context) async {
    String licenseImageData = licenseImage!;
    Navigator.pop(context);
    changeLoading(true);
    final response = await VehiclesApi.postNewVehicle(
      ownerId: userGeneralData!.id!,
      make: makeController.text,
      model: modelController.text,
      year: yearController.text,
    );
    if (response.errorFlag == false) {
      await VehiclesApi.postVehicleLicenseImageFile(
          id: response.values?['com_vehicleid'], imageBase64: licenseImageData);
      getMyVehiclesAndFamily();
    }
    changeLoading(false);
    update();
  }

  Future deleteVehicle(context, id) async {
    changeLoading(true);
    final response = await VehiclesApi.deleteVehicle(id: id);
    if (response.errorFlag == false) {
      getMyVehiclesAndFamily();
    }
    changeLoading(false);
    update();
  }

  Future editVehicle(context) async {
    String licenseImageData = licenseImage!;
    changeLoading(true);
    final response = await VehiclesApi.editVehicle(
      id: editingVehicle!.id!,
      make: makeController.text,
      model: modelController.text,
      year: yearController.text,
    );
    if (response.errorFlag == false) {
      await VehiclesApi.postVehicleLicenseImageFile(
          id: response.values?['com_vehicleid'], imageBase64: licenseImageData);
      getMyVehiclesAndFamily();
    }
    changeLoading(false);
    update();
  }

  onChangeOwnerIndex(int index, String? name) {
    selectedOwnerName = name ?? "Select Owner *";
    selectedOwnerIndex = index;
    update();
  }

  openBottomSheet(context, Widget widget) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  filldata(VehiclesModel data) {
    makeController.text = data.makeName ?? "";
    modelController.text = data.model ?? "";
    yearController.text = data.year ?? "";
    selectedOwnerName = data.relatedownerValue ?? "";
    selectedOwnerIndex = 0;
    editingVehicle = data;
  }

  clearData() {
    makeController.clear();
    modelController.clear();
    yearController.clear();
    selectedOwnerName = "Select Owner *";
    selectedOwnerIndex = -1;
    licenseImage = null;
    errormsg = null;
  }

  changeLoading(bool status) {
    loadingData = status;
    update();
  }

  pickImage() async {
    errorPickedImgRequired();
    try {
      await FilePicker.platform
          .pickFiles(type: FileType.image)
          .then((pickingResult) async {
        if (pickingResult != null) {
          File pickedFile = File(pickingResult.files.single.path!);
          List<int> fileBytes = await pickedFile.readAsBytes();
          licenseImage = await base64Encode(fileBytes);
          update();
        }
      });
    } catch (e) {
      print("++++++++++++ error in pick file${e.toString()}");
    }
  }

  errorPickedImgRequired({String? error}) {
    if (error != null) {
      errormsg = error;
    } else {
      errormsg = null;
    }
    update();
  }

  setFilterValue() {
    filterValue = "";
    print("userGeneralData!.type ${userGeneralData!.type}");
    if (userGeneralData!.type == 181410000) {
      filterValue =
          "(Microsoft.Dynamics.CRM.In(PropertyName='com_relatedowner',PropertyValues=";
      List<String> myFamilyListData = [];
      myFamilyListData.add("'${userGeneralData!.id}'");
      for (var e in myFamily) {
        myFamilyListData.add("'${e.id}'");
      }
      filterValue += "$myFamilyListData";
      filterValue += "))";
    } else {
      filterValue = "(_com_relatedowner_value eq ${userGeneralData!.id})";
    }
  }
}
