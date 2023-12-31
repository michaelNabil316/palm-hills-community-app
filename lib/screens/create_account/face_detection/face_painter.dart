import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter/material.dart';

class FacePainter extends CustomPainter {
  FacePainter({required this.imageSize, this.face});
  final Size imageSize;

  Face? face;
  @override
  void paint(Canvas canvas, Size size) {
    if (face == null) return;
    double scaleX, scaleY;
    Paint paint;

    if (face!.headEulerAngleY! > 10 || face!.headEulerAngleY! < -10) {
      paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0
        ..color = Colors.red;
    } else {
      paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0
        ..color = Colors.green;
    }

    scaleX = size.width / imageSize.width;
    scaleY = size.height / imageSize.height;

    canvas.drawRRect(
        _scaleRect(
            rect: face!.boundingBox,
            imageSize: imageSize,
            widgetSize: size,
            scaleX: scaleX,
            scaleY: scaleY),
        paint);
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.face != face;
  }
}

RRect _scaleRect(
    {required Rect rect,
    required Size imageSize,
    required Size widgetSize,
    double? scaleX,
    double? scaleY}) {
  return RRect.fromLTRBR(
      (widgetSize.width - rect.left.toDouble() * (scaleX ?? 0)),
      rect.top.toDouble() * (scaleY ?? 0),
      widgetSize.width - rect.right.toDouble() * (scaleX ?? 0),
      rect.bottom.toDouble() * (scaleY ?? 0),
      Radius.circular(10));
}
