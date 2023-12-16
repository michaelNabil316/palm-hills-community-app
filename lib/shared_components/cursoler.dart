import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/styles.dart';

class CustomCarousel extends StatelessWidget {
  final int count;
  final int selectedIndex;
  const CustomCarousel({
    super.key,
    required this.count,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: EdgeInsets.all(2),
          child: Transform.rotate(
            angle: pi / 4,
            child: Icon(
              Icons.square,
              size: 10.w,
              // color: selectedIndex == index
              //     ? AppColors.primary
              //     : AppColors.primary.withOpacity(0.5),
              color: AppColors.primary.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
