import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:palm_hills/repository/community_repository.dart';
import 'package:palm_hills/screens/community/model/announcement_model.dart';
import '../../../helper/constants.dart';
import '../../../shared_components/custom_text.dart';
import '../../../helper/styles.dart';
import '../../more/reservation/widgets/shimmer_image.dart';

class AnnounceDetailsBottomSHeet extends StatelessWidget {
  final AnnouncementModel annonce;

  const AnnounceDetailsBottomSHeet({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    // final ScrollController listViewcontroller =
    //     ScrollController(initialScrollOffset: 10.0);
    return Container(
      height: calculateHeight(
        annonce.name ?? "",
        annonce.description ?? "",
        annonce.picture != null ? [1] : [],
      ),
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.w),
              CustomText(
                text: annonce.date != null
                    ? DateFormat("d MMM yyyy  h:m a")
                        .format(DateTime.parse(annonce.date!))
                    : "No date",
                color: Colors.grey,
                fontFamily: AppFontNames.gillSans,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/icons/close_icon.svg",
                  color: AppColors.secondaryText,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: annonce.name ?? "No title",
            size: 18.sp,
            fontFamily: AppFontNames.gillSansBold,
          ),
          SizedBox(height: 25.h),
          if (annonce.picture != null)
            GestureDetector(
              onTap: () {
                //stop refresh for image
              },
              child: FutureBuilder(
                future: CommunityApi.getAnnouncementImage(annonce.id!),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    if (snapshot.data!.errorFlag == true) {
                      return Image.asset(
                        defaultCompoundAssetPath,
                        width: 0.8.sw,
                        height: 150.h,
                        fit: BoxFit.cover,
                      );
                    }
                    return Image.memory(
                      base64Decode(snapshot.data!.values),
                      width: 0.8.sw,
                      height: 150.h,
                      fit: BoxFit.cover,
                    );
                  }
                  return ShimmerImageLoader(width: 0.8.sw, height: 150.h);
                },
              ),
            ),
          //   if (imgUrl!.length > 1)
          //     SizedBox(
          //       height: 150.h,
          //       child: ListView.builder(
          //         controller: listViewcontroller,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) => Container(
          //           margin: EdgeInsets.symmetric(horizontal: 7.w),
          //           child: Image.network(
          //             imgUrl![index],
          //             height: 150.h,
          //             width: 0.8.sw,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         itemCount: imgUrl!.length,
          //       ),
          //     )
          //   else if (imgUrl!.length == 1)
          //     Image.network(
          //       imgUrl![0],
          //       height: 150.h,
          //       width: 0.87.sw,
          //       fit: BoxFit.cover,
          //     ),
          if (annonce.picture != null) SizedBox(height: 25.h),
          GestureDetector(
            onTap: () {
              //stop refresh for image
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomText(
                textAlign: TextAlign.start,
                text: annonce.description ?? "No description",
                size: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double calculateHeight(String? title, String? description, List? imgs) {
  double height = 100.h;
  if (title != null) {
    height += (title.length / 29) * 10;
  }
  if (description != null) {
    height += (description.length / 50) * 19;
  }
  if (imgs != null) {
    if (imgs.isNotEmpty) {
      height += 200;
    }
  }
  return height;
}
