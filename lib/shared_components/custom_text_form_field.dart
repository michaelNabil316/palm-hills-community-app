import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final double radius;
  final TextInputType textInputType;
  final TextEditingController controller;
  final validate;
  final Function()? onSuffixPressed;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(PointerDownEvent)? onTapOutside;
  final bool isPassword;
  final Function(String)? onChange;
  final bool? autoValidate;
  final bool? readOnly;
  final FocusNode? focusNode;
  final bool? autofocus;
  final int? maxLines;
  final Color? fillColor;
  final Color? textColor;
  final TextAlign? textAlign;
  final String? textFont;
  final double? fontSize;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.radius = 0.0,
    required this.textInputType,
    required this.controller,
    this.validate,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.onSuffixPressed,
    this.onTap,
    this.onEditingComplete,
    this.onTapOutside,
    this.onChange,
    this.autoValidate,
    this.focusNode,
    this.autofocus,
    this.readOnly,
    this.maxLines,
    this.fillColor,
    this.textColor,
    this.textAlign,
    this.textFont,
    this.fontSize,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      autovalidateMode:
          autoValidate == true ? AutovalidateMode.onUserInteraction : null,
      onChanged: onChange,
      obscureText: isPassword,
      obscuringCharacter: "*",
      validator: validate,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(112, 112, 112, 1),
            //     width: 1,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.secondaryText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondaryText.withOpacity(0.3),
          ),
        ),
        //  hintText: ,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.sp,
        ),
      ),
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: textColor ?? AppColors.secondaryText,
        fontFamily: textFont ?? AppFontNames.gillSans,
        fontSize: fontSize ?? 15.sp,
      ),
    );
  }
}
