import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraService {
  // singleton boilerplate
  static final CameraService _cameraServiceService = CameraService._internal();

  factory CameraService() {
    return _cameraServiceService;
  }
  // singleton boilerplate
  CameraService._internal();

  late CameraController _cameraController;
  CameraController get cameraController => this._cameraController;

  late CameraDescription _cameraDescription;

  late InputImageRotation _cameraRotation;
  InputImageRotation get cameraRotation => this._cameraRotation;

  Future startService(CameraDescription cameraDescription) async {
    _cameraDescription = cameraDescription;
    try {
      if (Platform.isAndroid) {
        _cameraController = CameraController(
          _cameraDescription,
          ResolutionPreset.max,
          enableAudio: false,
          // imageFormatGroup: ImageFormatGroup.unknown,
        );
        _cameraRotation = rotationIntToImageRotation(
          _cameraDescription.sensorOrientation,
        );
      } else {
        //iphone need image to be in bgra8888
        _cameraController = CameraController(
          _cameraDescription,
          ResolutionPreset.max,
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.bgra8888,
        );
        _cameraRotation = rotationIntToImageRotation(
          _cameraDescription.sensorOrientation,
        );
      }
      log("_cameraController imageFormatGroup ${_cameraController.imageFormatGroup}");
    } catch (e) {
      log("camera.sevice:error in startService:$e");
    }
    // Next, initialize the controller. This returns a Future.
    return _cameraController.initialize();
  }

  InputImageRotation rotationIntToImageRotation(int rotation) {
    try {
      switch (rotation) {
        case 0:
          return InputImageRotation.rotation0deg;
        case 90:
          return InputImageRotation.rotation90deg;
        case 180:
          return InputImageRotation.rotation180deg;
        case 270:
          return InputImageRotation.rotation270deg;
        default:
          return InputImageRotation.rotation270deg;
      }
    } catch (e) {
      log("rotationIntToImageRotation:error:$e");
    }
    return InputImageRotation.rotation270deg;
  }

  /// takes the picture and saves it in the given path 📸
  Future<void> takePicture(String imagePath) async {
    try {
      await _cameraController.takePicture()
        ..saveTo(imagePath);
    } catch (e) {
      log("camera.service:error in takePicture:$e");
    }
  }

  /// returns the image size 📏
  Size getImageSize() {
    try {
      return Size(
        _cameraController.value.previewSize!.height,
        _cameraController.value.previewSize!.width,
      );
    } catch (e) {
      log("camer.service:error in getImage size:$e");
    }
    return Size(
      _cameraController.value.previewSize!.height,
      _cameraController.value.previewSize!.width,
    );
  }

  dispose() {
    _cameraController.dispose();
  }
}
