import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../controller/switch_community_controller.dart';

class SwitchTitleName extends StatelessWidget {
  SwitchTitleName({super.key});
  final con = Get.put(SwitchCommunityCtrl(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchCommunityCtrl>(
      builder: (_) {
        return SizedBox(
          width: 200.w,
          child: CustomText(
            text: con.communityName,
            color: Colors.white,
            size: 22.sp,
            fontFamily: AppFontNames.gillSansBold,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
