import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/styles.dart';
import 'dart:math' as math;
import '../../../../shared_components/custom_buttons/button_small.dart';
import '../../../events/widgets/terms_item.dart';
import '../../model/gate_pass_model.dart';
import '../alert_delete_pass.dart';
import '../circle_bin.dart';

class GateSpaceCard extends StatefulWidget {
  final GatePassModel passModel;
  const GateSpaceCard({super.key, required this.passModel});

  @override
  State<GateSpaceCard> createState() => _GateSpaceCardState();
}

class _GateSpaceCardState extends State<GateSpaceCard> {
  bool isExpande = false;
  changeExpand() {
    setState(() {
      isExpande = !isExpande;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      color: Color(0xfff8f8f8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(width: 6.w),
                    CustomText(
                      text: "${widget.passModel.gateUsername}".toUpperCase(),
                      size: 16.sp,
                      fontFamily: AppFontNames.gillSansBold,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/calender.svg"),
                    SizedBox(width: 5.w),
                    CustomText(
                      text: "${widget.passModel.typeValue}  ",
                      size: 14.sp,
                      color: AppColors.secondaryText,
                    ),
                    Expanded(
                      child: CustomText(
                        text:
                            "Valid on ${formateDate(widget.passModel.entrydate)}",
                        size: 14.sp,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    changeExpand();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: isExpande ? "View Less" : "View More",
                        fontFamily: AppFontNames.gillSansBold,
                        size: 14.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 5.w),
                      Transform.rotate(
                          alignment: Alignment.center,
                          angle: isExpande ? math.pi : 0,
                          child: SvgPicture.asset(
                              "assets/icons/small_bottom_arrow.svg"))
                    ],
                  ),
                )
              ],
            ),
          ),
          if (isExpande)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  TermsItem(
                    text: "Valid for one day in Palm Hills Katemeya",
                  ),
                  SizedBox(height: 10.h),
                  TermsItem(
                    text: "Allows only one car",
                  ),
                  SizedBox(height: 10.h),
                  TermsItem(
                    text: "Single-entry",
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      CircleBinBtn(onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deletePassAlert(
                                context, widget.passModel.id!);
                          },
                        );
                      }),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomSmallButton(
                          onPressed: () {},
                          text: "Share Pass",
                          noIcon: true,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            )
        ],
      ),
    );
  }

  String formateDate(String? date) {
    if (date != null) {
      DateTime nDate = DateTime.parse(date);
      return DateFormat('MMM d, yyyy  h:m a').format(nDate);
    }
    return "unknown";
  }
}

// class RowItem extends StatelessWidget {
//   RowItem({super.key, required this.text});

//   String text;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Transform.rotate(
//             alignment: Alignment.center,
//             angle: math.pi * 1 / 4,
//             child: Icon(
//               Icons.square,
//               color: AppColors.primary,
//               size: 15,
//             )),
//         SizedBox(
//           width: 10.w,
//         ),
//         CustomText(
//           text: text,
//           size: 14.sp,
//           color: AppColors.primary,
//         ),
//       ],
//     );
//   }
// }
