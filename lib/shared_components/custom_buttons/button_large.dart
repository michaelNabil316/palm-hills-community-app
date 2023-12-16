import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/helper/styles.dart';
import '../custom_text.dart';
import 'package:lottie/lottie.dart' as lottie;

class CustomLargeButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool? stopBtnActivity;
  final bool? noIcon;
  final Color? primeColor;
  final Color? backColor;
  final Color? iconColor;

  const CustomLargeButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.stopBtnActivity,
    this.noIcon,
    this.primeColor,
    this.backColor,
    this.iconColor,
  });

  @override
  State<CustomLargeButton> createState() => _CustomLargeButtonState();
}

class _CustomLargeButtonState extends State<CustomLargeButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() => isLoading = true);
        await widget.onPressed();
        setState(() => isLoading = false);
      },
      child: Container(
        height: 58.h,
        // width: 342.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.5.r),
          border: Border.all(
              color: widget.stopBtnActivity == true
                  ? Colors.grey
                  : widget.primeColor ?? AppColors.primary,
              width: 1.sp),
          color: widget.backColor ?? Colors.white,
        ),
        child: Center(
          child: isLoading == true
              ? lottie.Lottie.asset("assets/animations/three_sqr_loader.json",
                  height: 25, fit: BoxFit.fitHeight)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: widget.text,
                      color: widget.stopBtnActivity == true
                          ? Colors.grey
                          : widget.primeColor ?? AppColors.primary,
                      fontFamily: AppFontNames.gillSansBold,
                      size: 16.sp,
                    ),
                    if (widget.noIcon != true) SizedBox(width: 4.w),
                    if (widget.noIcon != true)
                      SvgPicture.asset("assets/icons/double_arraw_right.svg",
                          color: widget.iconColor ??
                              (widget.stopBtnActivity == true
                                  ? Colors.grey
                                  : null)),
                  ],
                ),
        ),
      ),
    );
  }
}
