import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter/material.dart';

import 'camera.service.dart';

class MLVisionService {
  // singleton boilerplate
  static final MLVisionService _cameraServiceService =
      MLVisionService._internal();

  factory MLVisionService() {
    return _cameraServiceService;
  }
  // singleton boilerplate
  MLVisionService._internal();

  // service injection
  final CameraService _cameraService = CameraService();

 late FaceDetector _faceDetector;
  FaceDetector get faceDetector => _faceDetector;

  void initialize() {
    _faceDetector = FaceDetector(
      options:  FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
        enableClassification: true,
        // enableTracking: true,
        // enableContours: true,
        // enableLandmarks: true,
      ),
    );
  }

  Future<List<Face>> getFacesFromImage(CameraImage image) async {
    final InputImageRotation imageRotation =
        InputImageRotationValue.fromRawValue(_cameraService
                .cameraController.description.sensorOrientation) ??
            InputImageRotation.rotation0deg;
    final InputImageFormat inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw) ??
            InputImageFormat.nv21;

    /// preprocess the image  🧑🏻‍🔧
    InputImageData firebaseImageMetadata = InputImageData(
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      // rotation: _cameraService.cameraRotation,
      // rawFormat: image.format.raw,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      planeData: image.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );
    WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    /// Transform the image input for the _faceDetector 🎯
    InputImage firebaseVisionImage = InputImage.fromBytes(
        inputImageData: firebaseImageMetadata,
        bytes: Platform.isAndroid ? bytes : image.planes[0].bytes);

    /// proces the image and makes inference 🤖
    List<Face> faces = await _faceDetector.processImage(firebaseVisionImage);
    return faces;
  }
}
