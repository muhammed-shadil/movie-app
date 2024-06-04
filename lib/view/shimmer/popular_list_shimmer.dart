import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPopularList extends StatelessWidget {
  const ShimmerPopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: 110,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 110,
                    ),
                  ]));
            }));
  }
}
