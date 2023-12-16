import 'package:flutter/cupertino.dart' as cup;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_small.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/styles.dart';
import 'dart:math' as math;
import '../../../events/widgets/terms_item.dart';
import '../../controllers/my_space_controller.dart';
import '../../model/gate_pass_model.dart';

class FamilySpaceCard extends StatefulWidget {
  final GatePassModel passModel;
  const FamilySpaceCard({super.key, required this.passModel});

  @override
  State<FamilySpaceCard> createState() => _FamilySpaceCardState();
}

class _FamilySpaceCardState extends State<FamilySpaceCard> {
  bool isExpande = false;
  bool switcher = false;
  changeExpand() {
    setState(() {
      isExpande = !isExpande;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      switcher = widget.passModel.statecode == 1 ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      color: Color(0xfff8f8f8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Row(
                  children: [
                    SizedBox(width: 6.w),
                    CustomText(
                      text: "${widget.passModel.gateUsername}".toUpperCase(),
                      size: 16.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                    Spacer(),
                    GetBuilder<MySpaceController>(
                        init: MySpaceController(),
                        builder: (con) {
                          return Transform.scale(
                            scale: 0.8,
                            child: cup.CupertinoSwitch(
                              value: switcher,
                              onChanged: (value) {
                                setState(() {
                                  switcher = value;
                                });
                                con.changeGatePassStatus(
                                    id: widget.passModel.id!, value: value);
                              },
                            ),
                          );
                        }),
                    SizedBox(width: 6.w),
                  ],
                ),
                //SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 4.w),
                    SvgPicture.asset(
                      "assets/icons/person_logo.svg",
                      height: 12.h,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      children: [
                        SizedBox(height: 2.h),
                        CustomText(
                          text: "Empty", // child
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    changeExpand();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: isExpande ? "View Less" : "View More",
                        fontFamily: AppFontNames.gillSansBold,
                        size: 14.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 5.w),
                      Transform.rotate(
                          alignment: Alignment.center,
                          angle: isExpande ? math.pi : 0,
                          child: SvgPicture.asset(
                              "assets/icons/small_bottom_arrow.svg"))
                    ],
                  ),
                )
              ],
            ),
          ),
          if (isExpande)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  TermsItem(text: "Valid for one day in Palm Hills Katemeya"),
                  SizedBox(height: 10.h),
                  TermsItem(text: "Allows only one car"),
                  SizedBox(height: 10.h),
                  TermsItem(text: "Allows only one car"),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomSmallButton(
                          onPressed: () {},
                          text: "Share Pass",
                          noIcon: true,
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: "Pass is available on their app",
                    size: 12.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            )
        ],
      ),
    );
  }
}
