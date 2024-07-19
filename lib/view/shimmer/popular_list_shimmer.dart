import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPopularList extends StatelessWidget {
  const ShimmerPopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 110,
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 37, 37, 37),
              highlightColor: const Color.fromARGB(255, 119, 119, 119),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(8),
                width: 130,
                height: 80,
              ),
            ),
          ),
        );
      },
    );
  }
}
