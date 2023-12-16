import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/main.dart';
import 'package:palm_hills/repository/vehicle_repository.dart';
import 'package:palm_hills/screens/more/my_vehicles/controller/vehicle_controller.dart';
import 'package:palm_hills/screens/more/my_vehicles/model/vehicle_model.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import '../../../../helper/constants.dart';
import '../../../../helper/navigation.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../shared_components/custom_text_form_field.dart';
import '../../../../shared_components/note_error_container.dart';
import '../../../../helper/styles.dart';
import '../../../create_account/widgets/custom_drop_container.dart';
import '../../../my_space/widgets/circle_bin.dart';
import '../../reservation/widgets/shimmer_image.dart';
import '../add_successfuly.dart';
import 'owner_new_vehicle.dart';
import 'upload_card.dart';

class AddVehicleBottomSheet extends StatefulWidget {
  final VehiclesModel? data;
  const AddVehicleBottomSheet({
    super.key,
    this.data,
  });

  @override
  State<AddVehicleBottomSheet> createState() => _AddVehicleBottomSheetState();
}

class _AddVehicleBottomSheetState extends State<AddVehicleBottomSheet> {
  var addVehicleFormKey = GlobalKey<FormState>();
  final con = Get.put(VehicleCtrl());
  bool haveImg = false;

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      haveImg = widget.data?.carlicensepictureID != null;
      con.filldata(widget.data!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    con.clearData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleCtrl>(
      builder: (_) {
        return Container(
          height: 0.78.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: addVehicleFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      CustomText(
                        text: "ADD NEW VEHICLE",
                        size: 18.sp,
                        fontFamily: AppFontNames.gillSansBold,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/close_icon.svg",
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    label: "Make *",
                    textInputType: TextInputType.text,
                    controller: con.makeController,
                    validate: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else if (value.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    label: "Model *",
                    textInputType: TextInputType.text,
                    controller: con.modelController,
                    validate: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else if (value.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    label: "Year *",
                    textInputType: TextInputType.number,
                    controller: con.yearController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    validate: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else if (value.isEmpty) {
                        return "Field is required";
                      }
                    },
                  ),
                  SizedBox(height: 22.h),
                  GestureDetector(
                    onTap: () {
                      con.openBottomSheet(context, OwnersListBottomSheet());
                    },
                    child: CustomDropContainer(
                      text: con.selectedOwnerName,
                      isValueChanged: con.selectedOwnerIndex != -1,
                    ),
                  ),
                  SizedBox(height: 22.h),
                  // Text("data>>${widget.data?.carlicensepictureID}"),
                  if (haveImg)
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: FutureBuilder(
                            future: VehiclesApi.getVehicleLicenseImage(
                                widget.data!.id!),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                if (snapshot.data!.errorFlag == true) {
                                  return Image.network(
                                    defaultCompoundUrl,
                                    height: 120.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                }
                                return Image.memory(
                                  base64Decode(snapshot.data!.values),
                                  // height: 120.h,
                                  // width: double.infinity,
                                  // fit: BoxFit.fitHeight,
                                );
                              }
                              return ShimmerImageLoader(
                                height: 120.h,
                                width: double.infinity,
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.w),
                          child: CircleBinBtn(
                            onTap: () {
                              setState(() {
                                haveImg = false;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  //upload image
                  else
                    UploadCard(
                      imageBase64: con.licenseImage,
                      onTap: () {
                        con.pickImage();
                      },
                    ),
                  SizedBox(height: 22.h),
                  if (con.errormsg != null) ErrorContainer(text: con.errormsg!),
                  if (con.errormsg != null) SizedBox(height: 22.h),
                  CustomLargeButton(
                    onPressed: () async {
                      con.errorPickedImgRequired();
                      if (addVehicleFormKey.currentState?.validate() == true &&
                          con.selectedOwnerIndex != -1) {
                        if (con.licenseImage == null) {
                          con.errorPickedImgRequired(
                              error: "car license image required");
                          return;
                        }
                        if (widget.data == null) {
                          con.addVehicle(context).then((_) {
                            navigateTo(
                              navigatorKey.currentState!.context,
                              AddVehicleSuccessful(isEditCase: false),
                            );
                          });
                        } else {
                          con.editVehicle(context);
                          Navigator.pop(context);
                        }
                      }
                    },
                    text: widget.data == null ? "Add Vehicle" : "Save & Update",
                    noIcon: widget.data == null ? null : true,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
