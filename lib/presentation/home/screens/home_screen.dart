// ignore_for_file: depend_on_referenced_packages

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/components/appbars/home_appbar.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/domain/models/data_models/ebook_model.dart';
import 'package:trainyourbrain/presentation/home/compo/ebook_card.dart';
import 'package:trainyourbrain/presentation/providers/home_provider.dart';
import 'package:trainyourbrain/utils/constants/container_util.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:vector_math/vector_math.dart' as vector;
import '../../../config/router/nav_service.dart';
import '../../../domain/models/data_models/course_model.dart';
import '../../../domain/models/data_models/video_model.dart';
import '../../../utils/constants/k_colors.dart';
import '../compo/course_card.dart';
import '../compo/video_card.dart';

class HomeScreen extends StatefulWidget {
  static const id = KRoutes.homeScreen;
  final GlobalKey<ScaffoldState> drawerKey;
  const HomeScreen({required this.drawerKey, super.key});

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
    return Consumer<HomeProvider>(builder: (_, __, ___) {
      return Scaffold(
        appBar: HomeAppBar(drawerKey: widget.drawerKey),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: CarouselSlider(
                        items: __.homeCrouselImages
                            .map(
                              (item) => ClipRRect(
                                borderRadius: witRadiusStan,
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            Provider.of<HomeProvider>(context, listen: false)
                                .configHomeCrousel(index);
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: __.homeCrouselImages.map((entry) {
                        return GestureDetector(
                          // onTap: () =>
                          //     carouselController.animateToPage(entry.key),
                          child: Container(
                            width: __.homeCrouselindex ==
                                    __.homeCrouselImages.indexOf(entry)
                                ? 17
                                : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: __.homeCrouselindex ==
                                      __.homeCrouselImages.indexOf(entry)
                                  ? KColors.primaryColor
                                  : KColors.whiteColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Courses",
                    style: Kstyles.headingText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: KColors.blackColor,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const Sbh(h: 5),
              SizedBox(
                height: 310,
                width: double.infinity,
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: localCourseData.length,
                  itemBuilder: (context, index) {
                    final percent = (page - index).abs().clamp(0.0, 1.0);
                    final factor =
                        pageController.position.userScrollDirection ==
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "E-Books",
                    style: Kstyles.headingText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: KColors.blackColor,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      localEbookData.length,
                      (index) => EbookCard(
                        ebook: localEbookData[index],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Videos",
                    style: Kstyles.kHeadingTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: KColors.blackColor,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      localVideoData.length,
                      (index) => VideoCard(
                        video: localVideoData[index],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Continue watching",
                    style: Kstyles.kHeadingTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: KColors.blackColor,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      localVideoData.length,
                      (index) => VideoCard(
                        video: localVideoData[index],
                      ),
                    ),
                  ),
                ),
              ),
              const Sbh(h: 100),
            ],
          ),
        ),
      );
    });
  }
}

final List<VideoItem> localVideoData = [
  VideoItem(
    name: 'Flutter Advance Course - Clean Architecture with MVVM',
    description:
        "hey this is a demo course for animation style which helps you learn animation",
    courseBy: 'Mayank Yadav',
    courseRating: 5,
    numofReviews: 450,
    previewVideo: "",
  ),
  VideoItem(
    name: 'Flutter Advance Course - Clean Architecture with MVVM',
    description:
        "hey this is a demo course for animation style which helps you learn animation",
    courseBy: 'Mayank Yadav',
    courseRating: 5,
    numofReviews: 450,
    previewVideo: "",
  ),
  VideoItem(
    name: 'Flutter Advance Course - Clean Architecture with MVVM',
    description:
        "hey this is a demo course for animation style which helps you learn animation",
    courseBy: 'Mayank Yadav',
    courseRating: 5,
    numofReviews: 450,
    previewVideo: "",
  ),
  VideoItem(
    name: 'Flutter Advance Course - Clean Architecture with MVVM',
    description:
        "hey this is a demo course for animation style which helps you learn animation",
    courseBy: 'Mayank Yadav',
    courseRating: 5,
    numofReviews: 450,
    previewVideo: "",
  ),
];

final List<EbookItem> localEbookData = [
  EbookItem(
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
    discount: "17%",
  ),
  EbookItem(
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
    discount: "17%",
  ),
  EbookItem(
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
    discount: "17%",
  ),
  EbookItem(
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
    discount: "17%",
  ),
  EbookItem(
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
    discount: "17%",
  ),
];

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
