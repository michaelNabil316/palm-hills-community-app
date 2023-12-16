import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';

class LoadingData extends StatefulWidget {
  final double? height;
  const LoadingData({super.key, this.height});

  @override
  State<LoadingData> createState() => _LoadingDataState();
}

class _LoadingDataState extends State<LoadingData>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..repeat(reverse: true);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print("controller.value ${controller.value}");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: 1.sh,
        color: Colors.black.withOpacity(0.6),
        child: Column(
          children: [
            SizedBox(height: 0.4.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: controller.value * pi,
                  child: SvgPicture.asset(
                    "assets/icons/palm_hills_logo.svg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomText(
              text: "Loading..",
              color: Colors.white,
              size: 20.sp,
              isBold: true,
            )
          ],
        ),
      ),
    );
  }
}
