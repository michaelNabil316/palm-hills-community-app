import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/more/my_vehicles/controller/vehicle_controller.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../../../create_account/widgets/radio_relationships_item.dart';

class OwnersListBottomSheet extends StatelessWidget {
  const OwnersListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleCtrl>(
      init: VehicleCtrl(),
      builder: (controller) {
        return Container(
          height: 0.52.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  CustomText(
                    text: "Select owner",
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
              ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        controller.onChangeOwnerIndex(
                            index, controller.ownerVehicles[index]);
                        await Future.delayed(Duration(milliseconds: 250));
                        Navigator.pop(context);
                      },
                      child: RelationshipItem(
                          title: controller.ownerVehicles[index],
                          isSelected: controller.selectedOwnerIndex == index),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(height: 1, color: Colors.grey),
                  itemCount: controller.ownerVehicles.length)
            ],
          ),
        );
      },
    );
  }
}
