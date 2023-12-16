import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/styles.dart';

class RotatedBtnPlusOrMin extends StatelessWidget {
  final bool isAdd;
  final bool isAvaliable;
  final Function()? onTap;
  const RotatedBtnPlusOrMin({
    super.key,
    required this.isAdd,
    required this.isAvaliable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Transform.rotate(
        alignment: Alignment.center,
        angle: pi / 4,
        child: Container(
          width: 35.w,
          height: 35.w,
          decoration: BoxDecoration(
              border: Border.all(
                  color: isAvaliable ? AppColors.primary : Colors.grey,
                  width: 1)),
          child: Transform.rotate(
            alignment: Alignment.center,
            angle: -pi / 4,
            child: Icon(
              isAdd ? Icons.add : Icons.remove,
              size: 19.sp,
              color: isAvaliable ? AppColors.primary : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
