import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KShimmer extends StatelessWidget {
  final double? height, width;
  final double? radius;
  const KShimmer({
    this.height,
    this.radius,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 11),
          ),
        ),
      ),
    );
  }
}
