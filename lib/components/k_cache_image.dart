import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/container_util.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';

class KCacheImage extends StatelessWidget {
  final double? height, width, roundCorner;
  final String image;
  final bool? useLoading, fromHome;
  final BoxFit? fit;
  const KCacheImage({
    this.useLoading = false,
    this.fromHome = false,
    required this.image,
    this.roundCorner,
    this.height,
    this.width,
    super.key,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 45,
      height: height ?? 45,
      child: ClipRRect(
        borderRadius: fromHome!
            ? witRoundedShape
            : BorderRadius.circular(roundCorner ?? 100),
        child: CachedNetworkImage(
          fit: fit ?? BoxFit.cover,
          imageUrl: image,
          placeholder: (context, url) {
            return Visibility(
              visible: useLoading!,
              replacement: Image.asset(
                KAssets.loadingGif,
                fit: BoxFit.cover,
              ),
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 10,
                width: 10,
                child: const CircularProgressIndicator(),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              KAssets.errorAsset,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
