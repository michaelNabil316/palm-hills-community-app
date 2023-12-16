import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/screens/my_pass/controller/pass_controller.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';

class GateAndBeach extends StatelessWidget {
  const GateAndBeach({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassController>(
      init: PassController(),
      builder: (con) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                con.SetAction("Gate");
              },
              child: Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 45.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Set the border color here
                      width: 1.0, // Set the border width as needed
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: con.action == "Gate"
                        ? AppColors.secondaryText
                        : Colors.white),
                child: CustomText(
                  text: "Gate Pass",
                  color: con.action == "Gate"
                      ? Colors.white
                      : AppColors.secondaryText,
                  fontFamily:
                      con.action == "Gate" ? AppFontNames.gillSansBold : null,
                  size: 14.sp,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                con.SetAction("Beach");
              },
              child: Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 45.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Set the border color here
                      width: 1.0, // Set the border width as needed
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: con.action == "Beach"
                        ? AppColors.secondaryText
                        : Colors.white),
                child: CustomText(
                  text: "Beach Pass",
                  color: con.action == "Beach"
                      ? Colors.white
                      : AppColors.secondaryText,
                  fontFamily:
                      con.action == "Beach" ? AppFontNames.gillSansBold : null,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        );
      },
    );
  }
}
