import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/screens/my_pass/my_pass_screen.dart';
import 'package:get/get.dart';

class FloatingActionButoonCustomization extends StatelessWidget {
  const FloatingActionButoonCustomization({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 85.w,
          height: 122.h,
          // decoration: BoxDecoration(
          //   shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white.withOpacity(0.2),
          //     spreadRadius: 4,
          //     blurRadius: 8,
          //     offset: Offset(0, 4),
          //   ),
          // ],
          //),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => MyPassScreen());
          },
          child: Padding(
            padding: EdgeInsets.only(top: 23.h),
            child: SvgPicture.asset(
              "assets/icons/my_pass_icon.svg",
              height: 75.w,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        // ClipPath(
        //   clipper: RhombusClipper(),
        //   child: Container(
        //     width: 80.w,
        //     height: 120.h,
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.white.withOpacity(0.2),
        //           spreadRadius: 10,
        //           blurRadius: 5,
        //           offset: Offset(0, 7), // changes position of shadow
        //         ),
        //       ],
        //     ),
        //     child: IconButton(
        //       onPressed: () {
        //         Get.to(() => MyPassScreen());
        //       },
        //       icon: SvgPicture.asset(
        //         "assets/icons/my_pass_icon.svg",
        //         width: 50.w,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class RhombusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RhombusNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final path = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom) // Adjust this margin as needed
      ..lineTo(host.left, host.bottom) // Adjust this margin as needed
      ..close();
    return path;
  }

  Path getInnerPath(Rect host, Rect? guest) {
    return Path(); // Return an empty path for no clipping
  }
}
