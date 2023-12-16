import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../../../create_account/widgets/radio_relationships_item.dart';
import '../controller/send_us_msg_controller.dart';

class CompondsBottomSheet extends StatelessWidget {
  const CompondsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendUsAMsgCtrl>(
      init: SendUsAMsgCtrl(),
      builder: (con) {
        return Container(
          height: 0.43.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  CustomText(
                    text: "Select compound",
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
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        con.onChangeSelectedCompound(index);
                        await Future.delayed(Duration(milliseconds: 250));
                        Navigator.pop(context);
                      },
                      child: RelationshipItem(
                          title: appCompounds[index].comName ?? "Empty",
                          isSelected: con.selectedRelationIndex == index),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(height: 1, color: Colors.grey),
                  itemCount: appCompounds.length),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
