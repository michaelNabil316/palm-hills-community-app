import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaptureCameraBtn extends StatelessWidget {
  final Function() onTap;
  final Function()? onTapNoFace;
  final bool isActive;
  const CaptureCameraBtn({
    super.key,
    required this.onTap,
    this.onTapNoFace,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 36.r,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.white,
              ),
            ),
          )
        : SizedBox();
  }
}
