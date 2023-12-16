import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:palm_hills/screens/splash_screen.dart';
import '../../screens/events/event_details_screen.dart';

FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
String? dynamicLinkPageName;
String? dynamicLinkPageid;
Future<void> initDynamicLinks() async {
  print('============ initDynamicLinks ==========');
  await dynamicLinks.getInitialLink().then(
    (value) {
      print('deepLink value: ${value}');
      if (value != null) {
        dynamicLinkPageName = value.link.pathSegments[0];
        dynamicLinkPageid = value.link.pathSegments[1];
      }
    },
  );
}

Future<Uri> createDynamicLink(
    {bool? short, required String pageName, required String id}) async {
  final String DynamicLink =
      'https://palmhillscommunity.page.link/$pageName/$id';
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    link: Uri.parse(DynamicLink),
    uriPrefix: 'https://palmhillscommunity.page.link',
    androidParameters: const AndroidParameters(
      packageName: 'io.flutter.plugins.firebase.dynamiclinksexample',
      minimumVersion: 0,
    ),
    iosParameters: const IOSParameters(
      bundleId: 'io.flutter.plugins.firebase.dynamiclinksexample',
      minimumVersion: '0',
    ),
  );

  Uri url;
  if (short == true) {
    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    url = shortLink.shortUrl;
  } else {
    url = await dynamicLinks.buildLink(parameters);
  }
  return url;
}

Widget getDynamicLinkNavPage() {
  if (dynamicLinkPageName == "News") {
    return EventDetailsPage(
      id: dynamicLinkPageid ?? "",
      isEvent: false,
    );
  } else if (dynamicLinkPageName == "Event") {
    return EventDetailsPage(
      id: dynamicLinkPageid ?? "",
      isEvent: true,
    );
  }
  return SplashScreen();
}
