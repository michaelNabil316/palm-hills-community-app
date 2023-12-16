import 'package:flutter/cupertino.dart' as cup;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/my_space_controller.dart';

class entryDatePickerBottomSheet extends StatelessWidget {
  const entryDatePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySpaceController>(
      init: MySpaceController(),
      builder: (controller) {
        return Container(
          height: 0.25.sh,
          color: Color.fromRGBO(239, 239, 234, 1),
          child: cup.CupertinoDatePicker(
            mode: cup.CupertinoDatePickerMode.date,
            initialDateTime: controller.entryDate,
            onDateTimeChanged: (date) {
              controller.changeBirthDate(date);
            },
          ),
        );
      },
    );
  }
}
