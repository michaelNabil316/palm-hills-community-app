import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/shared_components/loader_widget.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import 'controller/terms_controller.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "TERMS OF USE",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: GetBuilder<TermsOfUseCtrl>(
        init: TermsOfUseCtrl(),
        builder: (con) {
          if (con.loadingData)
            return LoadingData();
          else
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45.h),
                    ...con.terms
                        .map(
                          (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "${e.title}",
                                size: 16.sp,
                                fontFamily: AppFontNames.gillSansBold,
                              ),
                              SizedBox(height: 5.h),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: "${e.description}",
                                size: 16.sp,
                              ),
                              SizedBox(height: 25.h),
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
