import 'package:flutter/material.dart';

class DividerWithUperShadow extends StatelessWidget {
  const DividerWithUperShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 5, // Blur radius
          offset: Offset(0, -3), // Offset to move the shadow upwards
        ),
      ]),
      child: SizedBox(),
    );
  }
}
