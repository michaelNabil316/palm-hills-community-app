import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared_components/custom_text.dart';

class RelationshipItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const RelationshipItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      child: Row(
        children: [
          CustomText(text: title),
          Spacer(),
          isSelected
              ? SvgPicture.asset("assets/icons/rhmobus_filled_selected.svg")
              : Transform.rotate(
                  alignment: Alignment.center,
                  angle: pi / 4,
                  child: Icon(
                    Icons.square_outlined,
                    size: 18.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
        ],
      ),
    );
  }
}
