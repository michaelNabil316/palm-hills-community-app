import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../../../../shared_components/custom_text.dart';
import '../../../../helper/styles.dart';
import '../../../create_account/widgets/radio_relationships_item.dart';
import '../controller/sales_inquiry_controller.dart';

class SalesInquirySelectCompondsBottomSheet extends StatelessWidget {
  const SalesInquirySelectCompondsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesInquiryCtrl>(
      init: SalesInquiryCtrl(),
      builder: (con) {
        return Container(
          height: 0.52.sh,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  CustomText(
                    text: "Select A Compound",
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
              Container(
                height: 0.44.sh,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          con.onChangeRelationIndex(index);
                          await Future.delayed(Duration(milliseconds: 250));
                          Navigator.pop(context);
                        },
                        child: RelationshipItem(
                            title: appCompounds[index].comName ?? "Empty",
                            isSelected: con.selectedCompoundIndex == index),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(height: 1, color: Colors.grey),
                    itemCount: appCompounds.length),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
