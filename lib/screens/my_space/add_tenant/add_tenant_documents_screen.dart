import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line.dart';
import '../../../shared_components/custom_buttons/button_large.dart';
import '../../../shared_components/custom_buttons/button_listtile.dart';
import '../../../shared_components/custom_text.dart';
import '../../../shared_components/two_colored_titles.dart';
import '../../create_account/widgets/create_account_road_map_item.dart';
import '../controllers/my_space_controller.dart';
import 'tenant_added_successfuly.dart';

class AddTenantDocumentsScreen extends StatelessWidget {
  const AddTenantDocumentsScreen({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CreateAccountRoadMapItem(
                          index: 1, currentIndex: 0, text: "Add details"),
                      CreateAccountRoadMapItem(
                          index: 1, currentIndex: 1, text: "Upload Documents"),
                    ],
                  ),
                  SizedBox(height: 42.h),
                  TwoColoredTexts(txt1: "Upload Tenant's", txt2: "Documents"),
                  SizedBox(height: 15.h),
                  CustomText(
                    text: "PNG, JPG, JPEG. 2 MB Max",
                    color: Colors.grey,
                    size: 12.sp,
                  ),
                  SizedBox(height: 15.h),
                  CustomBtnListTile(
                    title: "National ID - Front *",
                    leadingImgPath: "document_logo.svg",
                    trailingImgPath: "upload_arrow_up.svg",
                    onPress: () {},
                  ),
                  SizedBox(height: 10.h),
                  CustomBtnListTile(
                    title: "National ID - Back *",
                    leadingImgPath: "document_logo.svg",
                    trailingImgPath: "upload_arrow_up.svg",
                    onPress: () {},
                  ),
                  SizedBox(height: 10.h),
                  CustomBtnListTile(
                    title: "Upload Marriage Certificate",
                    leadingImgPath: "document_logo.svg",
                    trailingImgPath: "upload_arrow_up.svg",
                    onPress: () {},
                  ),
                  SizedBox(height: 10.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: con.tenantChilderList.length,
                    itemBuilder: (context, index) => CustomBtnListTile(
                      title: "Child ${index + 1} Birth Certificate *",
                      leadingImgPath: "document_logo.svg",
                      trailingImgPath: "upload_arrow_up.svg",
                      onPress: () {},
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                  ),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: CustomLargeButton(
                onPressed: () {
                  navigateTo(context, TenantAddedSuccessfuly());
                },
                noIcon: true,
                text: "Submit"),
          ),
        );
      },
    );
  }
}
