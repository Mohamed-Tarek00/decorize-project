import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimer extends StatelessWidget {
  const CustomLoadingShimer({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
  });
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: const Color.fromARGB(255, 255, 255, 255),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
