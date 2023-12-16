import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../shared_components/custom_text.dart';

class CreateAccountRoadMapItem extends StatefulWidget {
  final int index;
  final int currentIndex;
  final String text;

  const CreateAccountRoadMapItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.text,
  });

  @override
  State<CreateAccountRoadMapItem> createState() =>
      _CreateAccountRoadMapItemState();
}

class _CreateAccountRoadMapItemState extends State<CreateAccountRoadMapItem> {
  double turns = 0;
  changeTurns() {
    if (widget.index == widget.currentIndex) {
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => setState(() {
          turns += 1;
        }),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    changeTurns();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: widget.index == widget.currentIndex
              ? AppColors.primary
              : widget.currentIndex < widget.index
                  ? Colors.green
                  : Colors.grey.shade300,
          child: widget.index == widget.currentIndex
              ? AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 1),
                  child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: 15,
                      child:
                          Icon(Icons.square, color: Colors.white, size: 10.sp)))
              : widget.currentIndex < widget.index
                  ? Icon(Icons.check, color: Colors.white, size: 10.sp)
                  : Container(
                      padding: EdgeInsets.only(top: 2.h),
                      child: CustomText(
                        text: "${widget.currentIndex + 1}",
                        size: 12.sp,
                        color: AppColors.secondaryText.withOpacity(0.5),
                      ),
                    ),
        ),
        SizedBox(width: 4.w),
        CustomText(
          text: widget.text,
          size: 13.sp,
          color: widget.index == widget.currentIndex
              ? AppColors.primary
              : widget.currentIndex < widget.index
                  ? AppColors.secondaryText
                  : AppColors.secondaryText.withOpacity(0.5),
        ),
        if (widget.currentIndex < 2) SizedBox(width: 8.w),
      ],
    );
  }
}
