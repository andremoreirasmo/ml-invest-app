import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonTickerStocker extends StatelessWidget {
  const SkeletonTickerStocker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: SkeletonLine(
        style: SkeletonLineStyle(
            height: 26, width: 65, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
