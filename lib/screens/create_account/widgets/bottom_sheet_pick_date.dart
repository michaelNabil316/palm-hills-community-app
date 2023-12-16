import 'package:flutter/cupertino.dart' as cup;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/create_controller.dart';

class IosDatePickerBottomSheet extends StatelessWidget {
  const IosDatePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountCtrl>(
      init: CreateAccountCtrl(),
      builder: (controller) {
        return Container(
          height: 0.25.sh,
          color: Color.fromRGBO(239, 239, 234, 1),
          child: cup.CupertinoDatePicker(
            mode: cup.CupertinoDatePickerMode.date,
            initialDateTime: controller.birthDate,
            onDateTimeChanged: (date) {
              controller.changeBirthDate(date);
            },
          ),
        );
      },
    );
  }
}
