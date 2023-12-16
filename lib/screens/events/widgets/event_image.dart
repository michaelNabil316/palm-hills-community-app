import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/constants.dart';
import '../../../repository/event_repository.dart';
import '../../more/reservation/widgets/shimmer_image.dart';

class EventImage extends StatelessWidget {
  final String? id;
  final bool isEvent;
  const EventImage({super.key, required this.id, required this.isEvent});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 155.h,
      width: 1.sw,
      child: Center(
        child: FutureBuilder(
          future: EventApi.getEventImage(id!, isEvent),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data!.errorFlag == true) {
                return Image.network(
                  defaultCompoundUrl,
                  width: 342.w,
                  height: 215.h,
                  fit: BoxFit.cover,
                );
              }
              return Image.memory(
                base64Decode(snapshot.data!.values),
                width: 342.w,
                height: 215.h,
                fit: BoxFit.cover,
              );
            }
            return ShimmerImageLoader(width: 340.w, height: 160.h);
          },
        ),

/*
            Image.network(
                defaultCompoundUrl,
                width: 342.w,
                height: 215.h,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
              */
      ),
    );
  }
}
