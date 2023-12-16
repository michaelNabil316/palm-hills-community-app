import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImageLoader extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerImageLoader({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Color(0xFFEBEBF4),
          Color(0xFFFFFFFF),
          Color(0xFFEBEBF4),
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: SizedBox(),
      ),
    );
  }
}
