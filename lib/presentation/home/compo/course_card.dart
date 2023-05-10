import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainyourbrain/data/data_images.dart';
import 'package:trainyourbrain/domain/models/data_models/course_model.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../components/sizing_box.dart';
import '../../../utils/constants/container_util.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/responsive/size_config.dart';

class CourseCard extends StatelessWidget {
  final CourseItem courseItem;
  const CourseCard({required this.courseItem, super.key});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: witRadiusMid,
            child: CachedNetworkImage(
              imageUrl: dataCover,
              width: size.width * .6,
              fit: BoxFit.fill,
              height: 198,
            ),
          ),
          const Sbh(h: 4),
          SizedBox(
            width: size.width * .59,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                courseItem.name!,
                overflow: TextOverflow.clip,
                style: Kstyles.kMediumTextStyle.copyWith(
                  color: KColors.blackColor,
                ),
              ),
            ),
          ),
          const Sbh(h: 2.5),
          SizedBox(
            width: size.width * .57,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        courseItem.courseBy!,
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
                            courseItem.courseRating!.toString(),
                            style: Kstyles.kVerySmallTextStyle.copyWith(
                              color: Colors.amber,
                            ),
                          ),
                          const Sbw(w: 3),
                          Row(
                            children: List.generate(
                              courseItem.courseRating!.toInt(),
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 13,
                              ),
                            ),
                          ),
                          const Sbw(w: 3),
                          Text(
                            "(${courseItem.numofReviews!})",
                            style: Kstyles.kVerySmallTextStyle
                                .copyWith(color: Colors.amber),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: courseItem.isBestSeller!,
                  replacement: const SizedBox(),
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: KColors.primaryColor,
                      borderRadius: witRadiusSmall,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Best Seller",
                      style: Kstyles.kSmallTextStyle.copyWith(
                        color: KColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "₹${courseItem.oPrice}.00",
              style: Kstyles.kSmallTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
