import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../../../create_account/widgets/radio_relationships_item.dart';
import '../../controllers/my_space_controller.dart';

class UnitsBottomSheetMySpace extends StatelessWidget {
  const UnitsBottomSheetMySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySpaceController>(
      init: MySpaceController(),
      builder: (controller) {
        return Container(
          height: 0.52.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Request Invitation Code",
                      size: 18.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                  ),
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
              Container(
                height: 0.4.sh,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          controller.onChangeTenantUnitIndex(
                              index, controller.myUnits[index].comName);
                          await Future.delayed(Duration(milliseconds: 250));
                          Navigator.pop(context);
                        },
                        child: RelationshipItem(
                            title: controller.myUnits[index].comName ?? "",
                            isSelected:
                                controller.tenantSelectedUnitIndex == index),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(height: 1, color: Colors.grey),
                    itemCount: controller.myUnits.length),
              )
            ],
          ),
        );
      },
    );
  }
}
