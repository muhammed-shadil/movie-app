import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmercarosel extends StatelessWidget {
  const Shimmercarosel({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 11, 11, 11),
      highlightColor: Color.fromARGB(31, 74, 74, 74),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 238, 238),
            borderRadius: BorderRadius.circular(10)),
        height: 350,
      ),
    );
  }
}
