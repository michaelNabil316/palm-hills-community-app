import 'dart:async';
import 'package:flutter/material.dart';
import 'package:palm_hills/screens/user_data.dart';
import '../helper/navigation.dart';
import 'home/main_page_bottom_nav.dart';
import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  double value = 0.0;
  double opacity = 0;
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    // refreshFirstToken();
    changeOpacity();
  }

  Future<Widget> getHomePage() async {
    if (userGeneralData != null) {
      return MainPageBottomNav();
    }
    return LoginScreen();
  }

  // refreshFirstToken() async {
  //   if (ApiService.isTokenExpired() == true) {
  //     if ('${CacheHelper.getData(key: KeysName.accessToken)}' != "null") {
  //       log("start refresh token...");
  //       ApiService.refreshToken();
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
  }

  changeOpacity() {
    if (value < 1.0) {
      Timer.periodic(
          const Duration(seconds: 1),
          (timer) => {
                if (mounted)
                  {
                    setState(() {
                      value += 0.3;
                    })
                  }
              });
      Timer.periodic(
          const Duration(seconds: 3),
          (timer) => {
                if (mounted)
                  {
                    setState(() {
                      opacity = 1 - opacity;
                      changeOpacity();
                    })
                  }
              });
    } else {
      opacity = 1.0;
      if (isFirstTime) {
        navigate();
        setState(() {
          isFirstTime = false;
        });
      }
    }
  }

  navigate() async {
    navigateAndFinish(context, await getHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/splash_image.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
      // body: Stack(
      //   alignment: Alignment.topCenter,
      //   children: [
      //     Container(
      //       width: 1.sw,
      //       height: 1.sh,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage(
      //             "assets/images/splash_screen.JPG",
      //           ),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       child: SizedBox(),
      //     ),
      //     Container(
      //       width: 1.sw,
      //       height: 1.sh,
      //       color: Colors.black.withOpacity(0.3),
      //       child: SizedBox(),
      //     ),
      //     Column(
      //       children: [
      //         SizedBox(height: 0.192.sh),
      //         SvgPicture.asset(
      //           "assets/icons/palm_hills_logo.svg",
      //           fit: BoxFit.fitHeight,
      //         ),
      //         SizedBox(height: 10.h),
      //         CustomText(
      //           text: "PALM HILLS",
      //           color: Colors.white,
      //           //isBold: true,
      //           fontFamily: AppFontNames.gillSansCondensedBold,
      //           size: 24.sp,
      //         ),
      //         CustomText(
      //           text: "DEVELOPMENTS",
      //           color: Colors.white,
      //           size: 16.sp,
      //         ),
      //         SizedBox(height: 0.4.sh),
      //         CustomText(
      //           text: "THE PRIDE",
      //           color: Colors.white,
      //           //isBold: true,
      //           fontFamily: AppFontNames.gillSansMedium,
      //           size: 29.sp,
      //         ),
      //         // SizedBox(height: 5.h),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             Column(
      //               children: [
      //                 CustomText(
      //                   text: "of an  ",
      //                   color: Colors.white,
      //                   //isBold: true,
      //                   fontFamily: AppFontNames.gillSansMedium,
      //                   size: 14.sp,
      //                 ),
      //                 SizedBox(height: 3.h),
      //               ],
      //             ),
      //             CustomText(
      //               text: "Address",
      //               color: Colors.white,
      //               //isBold: true,
      //               fontFamily: AppFontNames.gillSansMedium,
      //               size: 29.sp,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),