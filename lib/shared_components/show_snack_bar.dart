// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../helper/styles.dart';

// Future<void> showCustomSnackbar({
//   required BuildContext context,
//   required String message,
//   required bool isSuccessBar,
// }) async {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.only(
//           bottom: MediaQuery.of(context).size.height -
//               2.9 * AppBar().preferredSize.height,
//           left: 20.w,
//           right: 20.w),
//       backgroundColor: isSuccessBar
//           ? AppColors.custometeal
//           : AppColors.SecondprimaryColorBtn,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         // side: BorderSide(
//         //   color: isSuccessBar
//         //       ? AppColors.custometeal
//         //       : AppColors.SecondprimaryColorBtn,
//         // ),
//       ),
//       content: Row(
//         children: [
//           Image.asset(
//             isSuccessBar
//                 ? "assets/images/happy-face.png"
//                 : "assets/images/sad-face.png",
//             width: 30.w,
//             height: 30.w,
//           ),
//           const SizedBox(
//             width: 15,
//           ),
//           Expanded(
//             child: CustomText(
//               text: message,
//               isBold: true,
//             ),
//           ),
//         ],
//       ),
//       duration: const Duration(seconds: 3),
//       closeIconColor: isSuccessBar
//           ? cup.Color.fromARGB(255, 23, 110, 103)
//           : cup.Color.fromARGB(255, 187, 59, 76),
//       showCloseIcon: true,
//     ),
//   );
// }
