import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:palm_hills/shared_components/custom_app_bars/app_bar_one_line.dart';
import 'face_detector.dart';
import 'ml_vision_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraDescription? cameraDescription;
  final MLVisionService _mlVisionService = MLVisionService();

  Future<bool> initiateDetector() async {
    print("1");
    try {
      print("2");
      List<CameraDescription> cameras = await availableCameras();
      print("cameras: $cameras");
      cameraDescription = cameras.firstWhere(
        (CameraDescription camera) =>
            camera.lensDirection == CameraLensDirection.front,
      );
      print("cameraDescription: $cameraDescription");
      _mlVisionService.initialize();
      return true;
    } catch (eee) {
      print("eee: $eee");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: initiateDetector(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (cameraDescription != null) {
            return Scaffold(
              appBar: appBarOneLine(
                title: "TAKE A SELFIE",
                onPressBackBtn: () => Navigator.pop(context),
              ),
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: 
                        FaceDetector(cameraDescription: cameraDescription!),
                        ),
                  ],
                ),
              ),
            );
          }
        }
        return const Column(
          children: [
            SizedBox(height: 250),
            Center(child: CircularProgressIndicator())
          ],
        );
      },
    );
  }
}
