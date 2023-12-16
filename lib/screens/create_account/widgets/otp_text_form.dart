import 'package:flutter/material.dart';
import '../../../helper/styles.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool? isLastOne;
  final validate;
  const OtpInput({
    Key? key,
    this.validate,
    this.isLastOne,
    required this.controller,
    required this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 40,
      child: TextFormField(
        validator: validate,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                width: 1.5,
                color: AppColors.secondaryText,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            counterText: '',
            hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            if (isLastOne != true) {
              FocusScope.of(context).nextFocus();
            }
            if (isLastOne == true) {
              FocusScope.of(context).unfocus();
            }
          }
        },
      ),
    );
  }
}
