import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/loader_widget.dart';
import '../../shared_components/custom_app_bars/app_bar_one_line.dart';
import '../../shared_components/custom_text_form_field.dart';
import '../../shared_components/main_colored_title.dart';
import '../events/widgets/terms_item.dart';
import 'controllers/my_space_controller.dart';
import 'widgets/bottom_sheet_date_picker.dart';
import 'widgets/bottom_sheet_new_pass_period_date.dart';
import 'widgets/custom_divider.dart';
import 'widgets/pass_type_checker.dart';

class GenerateNewPassScreen extends StatefulWidget {
  GenerateNewPassScreen({super.key});

  @override
  State<GenerateNewPassScreen> createState() => _GenerateNewPassScreenState();
}

class _GenerateNewPassScreenState extends State<GenerateNewPassScreen> {
  final newPassFormKey = GlobalKey<FormState>();
  final con = Get.put(MySpaceController());
  @override
  void deactivate() {
    super.deactivate();
    con.clearGeneralPageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLine(
        title: "GENERATE NEW PASS",
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: GetBuilder<MySpaceController>(builder: (_) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: newPassFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      MainTitleColored(title1: "PASS", title2: "TYPE"),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) => PassTypeChecker(
                          isSelected: con.selectedPassTypeIndex == i,
                          title: con.passTypes[i]['name'],
                          onTap: () {
                            con.changeSelectedPassType(i);
                          },
                        ),
                        separatorBuilder: (_, i) =>
                            SizedBox(height: 32.h, child: CustomDivider()),
                        itemCount: con.passTypes.length,
                      ),
                      SizedBox(height: 20.h),
                      MainTitleColored(title1: "Guest", title2: "TYPE"),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) => PassTypeChecker(
                          isSelected: con.selectedGuestTypeIndex == i,
                          title: con.guestTypes[i]['name'],
                          onTap: () {
                            con.changeSelectedGuestType(i);
                          },
                        ),
                        separatorBuilder: (_, i) =>
                            SizedBox(height: 32.h, child: CustomDivider()),
                        itemCount: con.guestTypes.length,
                      ),
                      if (con.selectedPassTypeIndex != -1 &&
                          con.selectedGuestTypeIndex != -1)
                        Column(
                          children: [
                            SizedBox(height: 40.h),
                            MainTitleColored(title1: "PASS", title2: "DETAILS"),
                            SizedBox(height: 30.h),
                            CustomTextFormField(
                              label: "Guest Name*",
                              textInputType: TextInputType.text,
                              controller: con.guestNameController,
                              onChange: (v) {
                                con.updating();
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z A-Z]')),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            if (con.selectedGuestTypeIndex != 2)
                              CustomTextFormField(
                                label: "Entry Date *",
                                textInputType: TextInputType.text,
                                controller: con.dateOfBirthController,
                                suffix: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                      "assets/icons/calender.svg"),
                                ),
                                readOnly: true,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  con.openBottomSheet(
                                      context, entryDatePickerBottomSheet());
                                },
                              ),
                            if (con.selectedGuestTypeIndex == 2)
                              CustomTextFormField(
                                label: "Validity Period *",
                                textInputType: TextInputType.text,
                                controller: con.newPassDate,
                                readOnly: true,
                                suffix: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                      "assets/icons/calender.svg"),
                                ),
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  con.openBottomSheet(
                                      context, NewPassDateFromToBottomSheet());
                                },
                              ),
                            SizedBox(height: 16.h),
                            ...[0, 1, 2]
                                .map(
                                  (e) => Container(
                                    margin: EdgeInsets.only(bottom: 3.h),
                                    child: TermsItem(
                                      text:
                                          "Valid for one day in Palm Hills Katemeya",
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      SizedBox(height: 40.h),
                      CustomLargeButton(
                        stopBtnActivity: con.stopSharePassBtn(),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (con.stopSharePassBtn() == false) {
                            con.createGatePass(context);
                          }
                        },
                        text: "Share Pass",
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
            if (con.loadingData) LoadingData()
          ],
        );
      }),
    );
  }
}
