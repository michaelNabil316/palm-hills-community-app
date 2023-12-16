import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/navigation.dart';
import '../../../helper/styles.dart';
import '../generate_new_pass.dart';

class AddGatePlusIcon extends StatelessWidget {
  const AddGatePlusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navigateTo(context, GenerateNewPassScreen());
      },
      icon: Icon(
        Icons.add_circle_outline,
        color: AppColors.primary,
        size: 30.sp,
      ),
    );
  }
}
