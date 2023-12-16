import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/shared_components/custom_text.dart';

class OneLineSwitchRadio extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(bool)? onChanged;
  const OneLineSwitchRadio({
    super.key,
    required this.isSelected,
    required this.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              textAlign: TextAlign.start,
              text: text,
              size: 16.sp,
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              value: isSelected,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
