import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainyourbrain/components/buttons/k_button.dart';
import 'package:trainyourbrain/components/k_cache_image.dart';
import 'package:trainyourbrain/data/data_images.dart';
import 'package:trainyourbrain/domain/models/data_models/course_model.dart';

import '../../components/buttons/k_border_button.dart';
import '../../components/sizing_box.dart';
import '../../utils/constants/container_util.dart';
import '../../utils/constants/k_colors.dart';
import '../../utils/constants/k_routes.dart';
import '../../utils/constants/kstyles.dart';
import '../../utils/responsive/size_config.dart';

class CourseScreen extends StatelessWidget {
  final CourseItem course;
  static const id = KRoutes.coursesScreen;
  const CourseScreen({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: KColors.blackColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: KColors.blackColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: KColors.blackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  KCacheImage(
                    image: dataCover,
                    roundCorner: 5,
                    width: size.width,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Spacer(flex: 4),
                        Icon(
                          FontAwesomeIcons.play,
                          color: KColors.whiteColor,
                        ),
                        Spacer(flex: 3),
                        Text(
                          "Preview this course",
                          style: Kstyles.kSmallTextStyle,
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                course.name!,
                style: Kstyles.kHeadingTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: KColors.blackColor,
                  fontSize: 22,
                ),
              ),
              Text(
                course.bio!,
                style: Kstyles.kSmallTextStyle.copyWith(
                  color: KColors().greyColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
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
              const Sbh(h: 5),
              Row(
                children: [
                  Text(
                    course.courseRating!.toString(),
                    style: Kstyles.kVerySmallTextStyle.copyWith(
                      color: Colors.amber,
                    ),
                  ),
                  const Sbw(w: 3),
                  Row(
                    children: List.generate(
                      course.courseRating!.toInt(),
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 13,
                      ),
                    ),
                  ),
                  const Sbw(w: 3),
                ],
              ),
              Text(
                "(${course.numofReviews.toString()} ratings) 28412 students",
                style: Kstyles.kVerySmallTextStyle,
              ),
              const Sbh(h: 8),
              Text(
                "₹${course.oPrice}.00",
                style: Kstyles.kHeadingTextStyle,
              ),
              const Sbh(h: 7),
              KButton(
                buttonName: 'Buy Now',
                onTap: () {},
                width: size.width * .92,
                useCircularCorner: true,
              ),
              const Sbh(h: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KBorderButton(
                    onTap: () {},
                    useGrey: false,
                    width: size.width * .43,
                    buttonName: "Add to cart",
                  ),
                  KBorderButton(
                    onTap: () {},
                    width: size.width * .43,
                    useGrey: false,
                    buttonName: "Add to wishlist",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
