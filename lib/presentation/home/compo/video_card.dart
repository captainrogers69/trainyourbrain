import 'package:flutter/material.dart';
import 'package:trainyourbrain/domain/models/data_models/video_model.dart';

import '../../../components/k_cache_image.dart';
import '../../../components/sizing_box.dart';
import '../../../data/data_images.dart';
import '../../../utils/constants/container_util.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/kstyles.dart';
import '../../../utils/responsive/size_config.dart';

class VideoCard extends StatelessWidget {
  final VideoItem video;
  const VideoCard({required this.video, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .8,
      margin: const EdgeInsets.symmetric(horizontal: 5)
          .copyWith(right: 5, bottom: 9),

      decoration: BoxDecoration(
        color: KColors.whiteColor,
        boxShadow: witBoxShadow,
        borderRadius: witRadiusMid,
      ),

      // padding: const EdgeInsets.all(11),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: witRadiusMid,
                child: KCacheImage(
                  image: dataCover,
                  width: size.width * .50,
                  fit: BoxFit.fill,
                  height: 198,
                  roundCorner: 10,
                ),
              ),
              const Sbh(h: 4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  video.name!,
                  style: Kstyles.kMediumTextStyle.copyWith(
                    color: KColors.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  video.courseBy!,
                  style: Kstyles.kVerySmallTextStyle.copyWith(
                    color: KColors.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text(
                      video.courseRating!.toString(),
                      style: Kstyles.kVerySmallTextStyle.copyWith(
                        color: Colors.amber,
                      ),
                    ),
                    const Sbw(w: 3),
                    Row(
                      children: List.generate(
                        video.courseRating!.toInt(),
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 13,
                        ),
                      ),
                    ),
                    const Sbw(w: 3),
                    Text(
                      "(${video.numofReviews!})",
                      style: Kstyles.kVerySmallTextStyle
                          .copyWith(color: Colors.amber),
                    ),
                  ],
                ),
              ),
              const Sbh(h: 4),
            ],
          ),
          SizedBox(
            height: 198,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_circle_right_sharp,
                  color: KColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
