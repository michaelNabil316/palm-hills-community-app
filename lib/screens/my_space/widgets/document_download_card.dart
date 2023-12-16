import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palm_hills/shared_components/custom_text.dart';

class DocumentDownloadCard extends StatelessWidget {
  final String text;
  const DocumentDownloadCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            size: 16.sp,
          ),
          SvgPicture.asset("assets/icons/arrow_download.svg"),
        ],
      ),
    );
  }
}
