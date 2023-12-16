import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text_form_field.dart';
import '../../../helper/navigation.dart';
import '../../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line.dart';
import '../../../shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_text.dart';
import '../../../shared_components/two_colored_titles.dart';
import '../../../helper/styles.dart';
import '../../create_account/widgets/create_account_road_map_item.dart';
import '../../create_account/widgets/custom_drop_container.dart';
import '../bottom_sheet_date_from_to.dart';
import '../controllers/my_space_controller.dart';
import 'add_tenant_documents_screen.dart';
import 'widgets/married_radio_box.dart';
import 'widgets/plus_min_rotated_btn.dart';
import 'widgets/units_bottom_sheet.dart';

class AddTenantScreen extends StatelessWidget {
  const AddTenantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySpaceController>(
      init: MySpaceController(),
      builder: (con) {
        return Scaffold(
          appBar: appBarOneLine(
            title: "ADD TENANT",
            subtitle: con.selectedUnitName,
            onPressBackBtn: () => Navigator.pop(context),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 42.h),
                  //const CreateAccountRoadMap(index: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CreateAccountRoadMapItem(
                          index: 0, currentIndex: 0, text: "Add details"),
                      CreateAccountRoadMapItem(
                          index: 0, currentIndex: 1, text: "Upload Documents"),
                    ],
                  ),
                  SizedBox(height: 42.h),
                  TwoColoredTexts(txt1: "ADD", txt2: "DETAILS"),
                  SizedBox(height: 24.h),
                  if (con.selectedUnitName == "")
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return UnitsBottomSheetMySpace();
                            },
                          );
                        },
                        child: CustomDropContainer(
                          text: con.tenantSelectedUnitName,
                          isValueChanged: con.tenantSelectedUnitIndex != -1,
                        )),
                  if (con.selectedUnitName == "") SizedBox(height: 24.h),
                  CustomTextFormField(
                      label: "Tenant Full Name *",
                      textInputType: TextInputType.name,
                      controller: con.tenantFullName),
                  SizedBox(height: 16.h),
                  PhoneTextField(
                      lable: "Tenant Mobile Number *",
                      controller: con.tenantMobile),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    label: con.tenancyPeriodTxt,
                    textInputType: TextInputType.text,
                    controller: con.birthDate,
                    readOnly: true,
                    suffix: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset("assets/icons/calender.svg"),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      con.openBottomSheet(context, DateFromToBottomSheet());
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomText(
                    text: "Tenant's Marital Status*",
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => con.changeSelectedTenantMarriage(0),
                        child: MarriedRadioBox(
                            text: "Married",
                            isSelected: con.selectedTenantMarriage == 0),
                      ),
                      InkWell(
                        onTap: () => con.changeSelectedTenantMarriage(1),
                        child: MarriedRadioBox(
                            text: "Not Married",
                            isSelected: con.selectedTenantMarriage == 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RotatedBtnPlusOrMin(
                        isAdd: false,
                        isAvaliable: con.tenantChildernNo > 0,
                        onTap: () => con.changeTenantChildernNo(false),
                      ),
                      SizedBox(
                        width: 218.w,
                        height: 48.h,
                        child: CustomTextFormField(
                          label: "No. of Tenant's Children *",
                          textInputType: TextInputType.name,
                          controller: TextEditingController(
                              text: "${con.tenantChildernNo}"),
                          textColor: AppColors.primary,
                          textAlign: TextAlign.center,
                          textFont: AppFontNames.gillSansBold,
                          fontSize: 20.sp,
                        ),
                      ),
                      RotatedBtnPlusOrMin(
                        isAdd: true,
                        isAvaliable: true,
                        onTap: () => con.changeTenantChildernNo(true),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: con.tenantChildernNo,
                    itemBuilder: (context, index) => CustomTextFormField(
                      label: "Child ${index + 1} age",
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      controller: con.tenantChilderList[index],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 25.h),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: CustomLargeButton(
                onPressed: () {
                  navigateTo(context, AddTenantDocumentsScreen());
                },
                noIcon: true,
                text: "Submit"),
          ),
        );
      },
    );
  }
}
