// import 'dart:convert';
// import 'package:flutter/material.dart';
// import '../../../helper/constants.dart';
// import '../../../repository/event_repository.dart';
// import '../../more/reservation/widgets/shimmer_image.dart';

// class HomeEventImageCard extends StatefulWidget {
//   final String id;
//   final bool isEvent;
//   final double height;
//   final double width;
//   const HomeEventImageCard({
//     super.key,
//     required this.id,
//     required this.isEvent,
//     required this.height,
//     required this.width,
//   });

//   @override
//   State<HomeEventImageCard> createState() => _HomeEventImageCardState();
// }

// class _HomeEventImageCardState extends State<HomeEventImageCard> {
//   bool isLoading = true;
//   String? imageData;
//   @override
//   void initState() {
//     super.initState();
//     getImageData();
//   }

//   getImageData() async {
//     setState(() => isLoading = true);
//     final response = await EventApi.getEventImage(widget.id, widget.isEvent);
//     print(
//         "EventApi.getEventImage ${response.errorFlag} ///////// ${response.values}");
//     if (response.errorFlag == false) {
//       setState(() => imageData = response.values);
//     }
//     setState(() => isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? ShimmerImageLoader(width: widget.width, height: widget.height)
//         : imageData != null
//             ? Image.memory(
//                 base64Decode(imageData!),
//                 width: widget.width,
//                 height: widget.height,
//                 fit: BoxFit.cover,
//               )
//             : Image.network(
//                 defaultCompoundUrl,
//                 width: widget.width,
//                 height: widget.height,
//                 fit: BoxFit.cover,
//               );
//   }
// }
