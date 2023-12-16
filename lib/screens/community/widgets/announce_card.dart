import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:palm_hills/screens/community/model/announcement_model.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/constants.dart';
import '../../../repository/community_repository.dart';
import '../../more/reservation/widgets/shimmer_image.dart';
import 'bottom_sheet_announce_details.dart';

class AnnounceCard extends StatelessWidget {
  final AnnouncementModel announcement;

  const AnnounceCard({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return AnnounceDetailsBottomSHeet(
              annonce: announcement,
            );
          },
        );
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.secondaryText.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              // if (imgUrl != null)
              //   imgUrl!.isNotEmpty
              //       ? Image.network(
              //           imgUrl![0],
              //           height: 100,
              //           width: double.infinity,
              //           fit: BoxFit.cover,
              //         )
              //       : SizedBox(),
              if (announcement.picture != null)
                FutureBuilder(
                  future: CommunityApi.getAnnouncementImage(announcement.id!),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      if (snapshot.data!.errorFlag == true) {
                        return Image.network(
                          defaultCompoundUrl,
                          width: double.infinity,
                          height: 100.h,
                          fit: BoxFit.cover,
                        );
                      }
                      return Image.memory(
                        base64Decode(snapshot.data!.values),
                        width: double.infinity,
                        height: 100.h,
                        fit: BoxFit.cover,
                      );
                    }
                    return ShimmerImageLoader(
                        width: double.infinity, height: 100.h);
                  },
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: announcement.date != null
                          ? DateFormat("d MMM yyyy  h:m a")
                              .format(DateTime.parse(announcement.date!))
                          : "No date",
                      color: Colors.grey,
                      fontFamily: AppFontNames.gillSans,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: announcement.name ?? "No title",
                      fontFamily: AppFontNames.gillSansBold,
                      size: 16.sp,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      textAlign: TextAlign.start,
                      text: announcement.description ?? "No description",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "Read more",
                          color: AppColors.primary,
                          fontFamily: AppFontNames.gillSansBold,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
