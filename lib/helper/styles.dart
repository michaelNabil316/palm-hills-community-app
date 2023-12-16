import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const primary = Color(0xFFd31148);
  static const primaryText = Color(0xFF828282);
  static const secondaryText = Color(0xFF191919);
  static const error = Color(0xFFff0000);
  static const success = Color(0xFF22bb33);
  static const alert = Color(0xFFf29339);
  static const dimmedField = Color(0xFFe0e0e0);
  static const outlineofField = Color(0xFFf2f2f2);
  static const whiteSugaer = Color(0xFFf8f8f8);
}

class AppFontNames {
  static const gillSansBoldItalic = "Gill Sans Bold Italic";
  static const gillSansBold = "Gill Sans Bold";
  static const gillSansHeavyItalic = "Gill Sans Heavy Italic";
  static const gillSansHeavy = "Gill Sans Heavy";
  static const gillSansItalic = "Gill Sans Italic";
  static const gillSansLightItalic = "Gill Sans Light Italic";
  static const gillSansLight = "Gill Sans Light";
  static const gillSansMediumItalic = "Gill Sans Medium Italic";
  static const gillSansMedium = "Gill Sans Medium";
  static const gillSans = "Gill Sans";
  static const gillSansCondensedBold = "GillSans Condensed Bold";
  static const gillSansCondensed = "GillSans Condensed";
}

final customLightThemeData = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    // iconTheme: IconThemeData(color: Colors.white),
    // titleTextStyle: TextStyle(
    //     color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    backgroundColor: AppColors.secondaryText,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.secondaryText,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    //actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.black54,
  ),
  // textTheme: TextTheme(
  //   //headline 1
  //   headlineLarge: TextStyle(
  //     fontSize: 24.sp,
  //     fontFamily: 'Gill Sans Bold',
  //     color: Colors.white,
  //     height: 36.sp,
  //   ),
  //   //headline 2
  //   headlineMedium: TextStyle(
  //     fontSize: 20.sp,
  //     fontFamily: 'Gill Sans Bold',
  //     color: Colors.white,
  //     height: 30.sp,
  //   ),
  //   //headline 3
  //   headlineSmall: TextStyle(
  //     fontSize: 18.sp,
  //     fontFamily: 'Gill Sans Bold',
  //     color: AppColors.primary,
  //     height: 27.sp,
  //   ),
  //   //headline 5
  //   titleLarge: TextStyle(
  //     fontSize: 16.sp,
  //     fontFamily: 'Gill Sans Bold',
  //     color: Colors.white,
  //     height: 24.sp,
  //   ),
  //   //Body 1
  //   bodyLarge: TextStyle(
  //     fontSize: 16.sp,
  //     fontFamily: 'Gill Sans Medium',
  //     color: AppColors.secondaryText,
  //     height: 24.sp,
  //   ),
  //   //headline 4
  //   titleMedium: TextStyle(
  //     fontSize: 16.sp,
  //     fontFamily: 'Gill Sans Medium',
  //     color: Colors.white,
  //     height: 24.sp,
  //   ),
  //   //Body 3
  //   bodyMedium: TextStyle(
  //     fontSize: 14.sp,
  //     fontFamily: 'Gill Sans Bold',
  //     color: AppColors.secondaryText,
  //     height: 21.sp,
  //   ),
  //   //Body 2
  //   bodySmall: TextStyle(
  //     fontSize: 14.sp,
  //     fontFamily: 'Gill Sans Medium',
  //     color: AppColors.secondaryText,
  //     height: 21.sp,
  //   ),
  //   // Subheading 1
  //   titleSmall: TextStyle(
  //     fontSize: 14.sp,
  //     fontFamily: 'Gill Sans Medium',
  //     color: Colors.white,
  //     height: 21.sp,
  //   ),
  //   //tooltip
  //   displaySmall: TextStyle(
  //     fontSize: 12.sp,
  //     fontFamily: 'Gill Sans',
  //     color: AppColors.secondaryText,
  //     height: 18.sp,
  //   ),
  // ),
);
