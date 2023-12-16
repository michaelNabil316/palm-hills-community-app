import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color color;
  final double? size;
  final TextAlign textAlign;
  final bool bolUnderline;
  final bool? softWrap;
  final bool? underline;
  final bool? isBold;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.text,
    this.color = AppColors.secondaryText,
    this.size,
    this.textAlign = TextAlign.center,
    this.bolUnderline = false,
    this.fontFamily,
    this.softWrap,
    this.underline,
    this.maxLines,
    this.overflow,
    this.style,
    this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: overflow,
        style: style ??
            TextStyle(
              color: color,
              fontSize: size ?? 16.sp,
              fontFamily: fontFamily ??
                  (isBold == true
                      ? AppFontNames.gillSansBold
                      : AppFontNames.gillSansMedium),
              decoration: underline == true ? TextDecoration.underline : null,
              decorationThickness: bolUnderline ? 1.5 : 0.6,
            ),
      ),
    );
  }
}
