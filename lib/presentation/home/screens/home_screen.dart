// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trainyourbrain/components/appbars/home_appbar.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:vector_math/vector_math.dart' as vector;
import '../../../config/router/nav_service.dart';
import '../../../domain/models/data_models/course_model.dart';
import '../../../utils/constants/k_colors.dart';
import '../compo/course_card.dart';

class HomeScreen extends StatefulWidget {
  static const id = KRoutes.homeScreen;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(viewportFraction: 0.8);
  double page = 0.0;
  void listenScroll() {
    setState(() {
      page = pageController.page!;
    });
  }

  @override
  void initState() {
    pageController.addListener(listenScroll);

    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(listenScroll);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 310,
            width: double.infinity,
            child: PageView.builder(
              controller: pageController,
              itemCount: localCourseData.length,
              itemBuilder: (context, index) {
                final percent = (page - index).abs().clamp(0.0, 1.0);
                final factor = pageController.position.userScrollDirection ==
                        ScrollDirection.forward
                    ? 1.0
                    : -1.0;
                final opacity = percent.clamp(0.0, 0.7);
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(vector.radians(45 * factor * percent)),
                  child: Opacity(
                    opacity: (1 - opacity),
                    child: InkWell(
                      onTap: () {
                        Navigate.instance.navigateTo(
                          KRoutes.coursesScreen,
                          args: localCourseData[index],
                        );
                      },
                      child: CourseCard(
                        courseItem: localCourseData[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "E-Books",
              style: Kstyles.headingText.copyWith(
                fontWeight: FontWeight.bold,
                color: KColors.whiteColor,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Categories",
                style: Kstyles.kHeadingTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: KColors.whiteColor,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<CourseItem> localCourseData = [
  CourseItem(
      name: 'Flutter Advance Course - Clean Architecture with MVVM',
      description:
          "hey this is a demo course for animation style which helps you learn animation",
      category: "animation",
      dPrice: "450",
      assignments: 0,
      bio: 'Become a job ready flutter developer',
      courseBy: 'Mayank Yadav',
      courseRating: 5,
      createdAt: Timestamp.now(),
      imageUrls: [
        'https://img.freepik.com/free-vector/cute-panda-with-bamboo_138676-3053.jpg?w=2000'
      ],
      intructorInfo: {},
      isBestSeller: true,
      isCertificate: false,
      isLifetimeAcess: true,
      language: "Hindi",
      numofReviews: 450,
      previewLink: "",
      previewVideo: '',
      requirements: [],
      sectionsInfo: {},
      subtitle: "Hindi",
      supportFiles: true,
      thumbnail: "",
      updatedAt: Timestamp.now(),
      videoUrls: [],
      whatYoullLearn: [],
      oPrice: "575",
      discount: "17%"),
  CourseItem(
      name: 'Flutter Advance Course - Clean Architecture with MVVM',
      description:
          "hey this is a demo course for animation style which helps you learn animation",
      category: "animation",
      dPrice: "450",
      assignments: 0,
      bio: 'Become a job ready flutter developer',
      courseBy: '',
      courseRating: 4,
      createdAt: Timestamp.now(),
      imageUrls: [],
      intructorInfo: {},
      isBestSeller: true,
      isCertificate: false,
      isLifetimeAcess: true,
      language: "Hindi",
      numofReviews: 450,
      previewLink: "",
      previewVideo: '',
      requirements: [],
      sectionsInfo: {},
      subtitle: "Hindi",
      supportFiles: true,
      thumbnail: "",
      updatedAt: Timestamp.now(),
      videoUrls: [],
      whatYoullLearn: [],
      oPrice: "575",
      discount: "17%"),
  CourseItem(
      name: 'Flutter Advance Course - Clean Architecture with MVVM',
      description:
          "hey this is a demo course for animation style which helps you learn animation",
      category: "animation",
      dPrice: "450",
      assignments: 0,
      bio: '',
      courseBy: '',
      courseRating: 4,
      createdAt: Timestamp.now(),
      imageUrls: [],
      intructorInfo: {},
      isBestSeller: true,
      isCertificate: false,
      isLifetimeAcess: true,
      language: "Hindi",
      numofReviews: 450,
      previewLink: "",
      previewVideo: '',
      requirements: [],
      sectionsInfo: {},
      subtitle: "Hindi",
      supportFiles: true,
      thumbnail: "",
      updatedAt: Timestamp.now(),
      videoUrls: [],
      whatYoullLearn: [],
      oPrice: "575",
      discount: "17%"),
  CourseItem(
      name: 'Flutter Advance Course - Clean Architecture with MVVM',
      description:
          "hey this is a demo course for animation style which helps you learn animation",
      category: "animation",
      dPrice: "450",
      assignments: 0,
      bio: '',
      courseBy: '',
      courseRating: 4,
      createdAt: Timestamp.now(),
      imageUrls: [],
      intructorInfo: {},
      isBestSeller: true,
      isCertificate: false,
      isLifetimeAcess: true,
      language: "Hindi",
      numofReviews: 450,
      previewLink: "",
      previewVideo: '',
      requirements: [],
      sectionsInfo: {},
      subtitle: "Hindi",
      supportFiles: true,
      thumbnail: "",
      updatedAt: Timestamp.now(),
      videoUrls: [],
      whatYoullLearn: [],
      oPrice: "575",
      discount: "17%"),
  CourseItem(
      name: 'Flutter Advance Course - Clean Architecture with MVVM',
      description:
          "hey this is a demo course for animation style which helps you learn animation",
      category: "animation",
      dPrice: "450",
      assignments: 0,
      bio: '',
      courseBy: '',
      courseRating: 4,
      createdAt: Timestamp.now(),
      imageUrls: [],
      intructorInfo: {},
      isBestSeller: true,
      isCertificate: false,
      isLifetimeAcess: true,
      language: "Hindi",
      numofReviews: 450,
      previewLink: "",
      previewVideo: '',
      requirements: [],
      sectionsInfo: {},
      subtitle: "Hindi",
      supportFiles: true,
      thumbnail: "",
      updatedAt: Timestamp.now(),
      videoUrls: [],
      whatYoullLearn: [],
      oPrice: "575",
      discount: "17%"),
];
