import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import 'controller/setting_controller.dart';
import 'widgets/language_checker.dart';

class LanguageSettingScreen extends StatelessWidget {
  const LanguageSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOneLineWithIcon(
        title: "LANGUAGE",
        plusWidget: SizedBox(width: 25.w),
        onPressPluskBtn: () {},
        onPressBackBtn: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<SettingCtrl>(
            init: SettingCtrl(),
            builder: (con) {
              return Column(
                children: [
                  SizedBox(height: 45.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) => LanguageChecker(
                      isSelected: con.selectedLangIndex == i,
                      title: con.langs[i],
                      onTap: () {
                        con.changeSelectedLang(i);
                      },
                    ),
                    separatorBuilder: (_, i) => SizedBox(height: 16.h),
                    itemCount: con.langs.length,
                  ),
                  SizedBox(height: 16.h),
                ],
              );
            }),
      ),
    );
  }
}
