import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared_components/custom_text.dart';


class ActiveButton extends StatelessWidget {
  const ActiveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:Color(0xffe0e0e)
      ),
      width: 70.w,
      height: 30.h,
      child: CustomText(text:"Active",color: Color(0xff22bb33),),
    );
  }
}
