import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/screens/user_data.dart';
import 'package:palm_hills/helper/styles.dart';
import 'package:get/get.dart';
import 'helper/cash_helper/shared_pref.dart';
import 'helper/encrypt_helper.dart';
import 'helper/firebase_helper/dynamic_link.dart';
import 'helper/firebase_helper/firebase_fuctions.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EncryptionHelper.init();
  await initializeMyFireBase();
  await CacheHelper.init();
  await getCachedUserData();
  await initDynamicLinks();
  getMySharedData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 843),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Palm Hills',
          theme: customLightThemeData,
          debugShowCheckedModeBanner: false,
          home: getDynamicLinkNavPage(),
        );
      },
    );
  }
}
