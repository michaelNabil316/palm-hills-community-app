import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter/material.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'face_painter.dart';
import 'camera.service.dart';
import 'ml_vision_service.dart';
import 'package:get/get.dart';

class FaceDetector extends StatefulWidget {
  final CameraDescription cameraDescription;
  const FaceDetector({Key? key, required this.cameraDescription})
      : super(key: key);

  @override
  FaceDetectorState createState() => FaceDetectorState();
}

class FaceDetectorState extends State<FaceDetector> {
  CameraService cameraService = CameraService();
  MLVisionService mlVisionService = MLVisionService();
  late Future initializeControllerFuture;
  List<Face> faceDetectedFrames = [];
  List<String> imagesPaths = [];
  bool detectingFaces = false;
  bool pictureTaken = false;
  String? imagePath;
  late Size imageSize;
  Face? faceDetected;
  int counter = 15;
  int timeoutCounter = 4;
  String instructions = "";
  int attempts = 0;
  File? file;
  Future<void> finishSigning(path) async {
    if (path == null) return;
    setState(() {
      file = File(path);
    });
  }

  restartProcess() {
    setState(() {
      faceDetectedFrames = [];
      faceDetected = null;
      imagePath = null;
      faceDetected = null;
      pictureTaken = false;
      imagesPaths = [];
      detectingFaces = false;
      counter = 15;
      timeoutCounter = 4;
      instructions = "";
      attempts = 0;
      file = null;
    });
    start();
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    start();
    // });
  }

  @override
  void dispose() {
    cameraService.dispose();
    super.dispose();
  }

  /// starts the camera & start framing faces
  start() async {
    try {
      initializeControllerFuture =
          cameraService.startService(widget.cameraDescription);
      await initializeControllerFuture;
      frameFaces();
    } catch (e) {
      log("face_detector:error in start:$e");
    }
  }

  /// draws rectangles when detects faces
  frameFaces() async {
    imageSize = cameraService.getImageSize();
    cameraService.cameraController.startImageStream((image) async {
      // ignore: unnecessary_null_comparison
      if (cameraService.cameraController != null) {
        // if its currently busy, avoids overprocessing
        if (detectingFaces) return;
        detectingFaces = true;
        try {
          List<Face> faces = await mlVisionService.getFacesFromImage(image);
          log("faces >>>>> $faces");
          // ignore: unnecessary_null_comparison
          if (faces != null) {
            if (faces.isNotEmpty) {
              faceDetected = faces[0];
              if (faceDetectedFrames.length < 3) {
                if (faceDetectedFrames.isEmpty) {
                  faceDetectedFrames.add(faceDetected!);
                  await onShot();
                } else if (faceDetectedFrames.isNotEmpty &&
                    compareBetweenFrames(
                        faceDetected!, faceDetectedFrames.length - 1)) {
                  faceDetectedFrames.add(faceDetected!);
                  await onShot();
                } else {
                  log("timeoutCounter:$timeoutCounter");

                  /// If User is showing image "It Must blink or timeout would"
                  await Future.delayed(const Duration(milliseconds: 600), () {
                    setState(() {
                      timeoutCounter--;
                    });
                  });
                }
                if (timeoutCounter == 0) {
                  log("106");
                  setState(() {
                    instructions = 'Try to Smile Now'.tr;
                  });
                }
                if (timeoutCounter < 0) {
                  log("117:timeoutCounter: $timeoutCounter");
                  if (faceDetectedFrames.length == 1 && faceDetected != null) {
                    if (faceDetected!.smilingProbability! > 0.5) {
                      faceDetectedFrames.add(faceDetected!);
                      faceDetectedFrames.add(faceDetected!);
                      await onShot();
                    }
                  }
                }
                if (timeoutCounter == -5) {
                  endSelfieSession();
                  return;
                }
                await Future.delayed(const Duration(milliseconds: 100));
                frameFaces();
              } else {
                setState(() {
                  pictureTaken = true;
                  imagePath = imagesPaths.last;
                  // iSignStatusData.changeImage(File(imagePath));/////////////////////////////////
                });
                await Future.delayed(const Duration(milliseconds: 500));
                await cameraService.cameraController.stopImageStream();
                finishSigning(imagePath);
              }
            } else {
              setState(() {
                faceDetected = null;
              });
              await Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  counter--;
                });
              });
              if (counter == 10) {
                setState(() {
                  instructions =
                      'Please Stand in front of the camera to take a selfie.'
                          .tr;
                });
              }
              if (counter == 0) {
                endSelfieSession();
              }
            }
          }
          detectingFaces = false;
        } catch (e) {
          detectingFaces = false;
          log("frameFaces error:$e");
        }
      }
    });
  }

  Future<void> onShot() async {
    log("onShot .... faceDetected > $faceDetected");
    if (faceDetected == null) {
      return;
    } else {
      try {
        imagePath =
            join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
        log('Image Saved');
        await Future.delayed(const Duration(milliseconds: 100));
        await cameraService.cameraController.stopImageStream();
        await Future.delayed(const Duration(milliseconds: 500));
        await cameraService.takePicture(imagePath!);
        imagesPaths.add(imagePath!);
        setState(() {});
        return;
      } catch (e) {
        log("onShot error:$e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<void>(
      future: initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (pictureTaken) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Transform.flip(
                  flipX: Platform.isAndroid ? true : false,
                  child: SizedBox(
                      height: size.height - 150,
                      child: Image.file(File(imagePath!))),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          child: CustomLargeButton(
                            text: "Done".tr,
                            noIcon: true,
                            onPressed: () {
                              Navigator.of(context).pop(imagePath);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: CustomLargeButton(
                            stopBtnActivity: true,
                            text: "Retake".tr,
                            noIcon: true,
                            onPressed: () {
                              restartProcess();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ],
            );
          } else {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                SizedBox(
                  height: size.height - 150,
                  width: size.width,
                  child: CameraPreview(cameraService.cameraController),
                ),
                SizedBox(
                  height: size.height - 150,
                  width: size.width,
                  child: CustomPaint(
                    painter:
                        FacePainter(face: faceDetected, imageSize: imageSize),
                  ),
                ),
                Column(
                  children: [
                    //capture btn
                    // CaptureCameraBtn(
                    //   isActive: faceDetected != null,
                    //   onTap: () async {
                    //     log("imagesPaths >> $imagesPaths");
                    //     setState(() {
                    //       pictureTaken = true;
                    //       imagePath = imagesPaths.last;
                    //       timeoutCounter == -5;
                    //     });
                    //     await cameraService.cameraController.stopImageStream();
                    //   },
                    //   onTapNoFace: () {
                    //     log("onTapNoFace");
                    //     restartProcess();
                    //   },
                    // ),
                    const SizedBox(height: 5),
                    // if there is an error
                    Text(
                      instructions,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  bool compareBetweenFrames(Face currentFace, int faceIndex) {
    if (smilingDiffers(currentFace, faceIndex) &&
        leftEyeOpenDiffers(currentFace, faceIndex) &&
        rightEyeOpenDiffers(currentFace, faceIndex) &&
        headEulerAngleYDiffers(currentFace, faceIndex) &&
        headEulerAngleZDiffers(currentFace, faceIndex)) return true;
    return false;
  }

  String getDigitsAfterPoint(double? number) {
    return number.toString().split(".")[1].substring(0, 2);
  }

  bool smilingDiffers(Face currentFace, faceIndex) {
    return getDigitsAfterPoint(currentFace.smilingProbability) !=
        getDigitsAfterPoint(faceDetectedFrames[faceIndex].smilingProbability);
  }

  bool leftEyeOpenDiffers(Face currentFace, faceIndex) {
    return getDigitsAfterPoint(currentFace.leftEyeOpenProbability) !=
        getDigitsAfterPoint(
            faceDetectedFrames[faceIndex].leftEyeOpenProbability);
  }

  bool rightEyeOpenDiffers(Face currentFace, faceIndex) {
    return getDigitsAfterPoint(currentFace.rightEyeOpenProbability) !=
        getDigitsAfterPoint(
            faceDetectedFrames[faceIndex].rightEyeOpenProbability);
  }

  bool headEulerAngleYDiffers(Face currentFace, faceIndex) {
    return getDigitsAfterPoint(currentFace.headEulerAngleY) !=
        getDigitsAfterPoint(faceDetectedFrames[faceIndex].headEulerAngleY);
  }

  bool headEulerAngleZDiffers(Face currentFace, faceIndex) {
    return getDigitsAfterPoint(currentFace.headEulerAngleZ) !=
        getDigitsAfterPoint(faceDetectedFrames[faceIndex].headEulerAngleZ);
  }

  repeatVariables() {
    faceDetectedFrames.removeWhere((element) => true);
    imagesPaths.removeWhere((element) => true);
    pictureTaken = false;
    imagePath = null;
    faceDetected = null;
    counter = 15;
    timeoutCounter = 15;
    instructions = "";
  }

  repeatSelfieSession() {
    repeatVariables();
  }

  endSelfieSession() async {
    repeatVariables();
    await Future.delayed(const Duration(milliseconds: 500));
    await cameraService.cameraController.stopImageStream();
  }
}
