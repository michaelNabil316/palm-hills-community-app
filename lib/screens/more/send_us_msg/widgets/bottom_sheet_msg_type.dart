import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../../../create_account/widgets/radio_relationships_item.dart';
import '../controller/send_us_msg_controller.dart';

class MsgTypeSelectCompondsBottomSheet extends StatelessWidget {
  const MsgTypeSelectCompondsBottomSheet({super.key});

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
                    text: "Select Message Type",
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
              Spacer(),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        con.onChangeRelationIndex(index);
                        await Future.delayed(Duration(milliseconds: 250));
                        Navigator.pop(context);
                      },
                      child: RelationshipItem(
                          title: con.msgTypList[index],
                          isSelected: con.selectedRelationIndex == index),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(height: 1, color: Colors.grey),
                  itemCount: con.msgTypList.length),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
