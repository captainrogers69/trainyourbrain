import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

class SearchScreen extends StatefulWidget {
  static const id = KRoutes.searchScreen;
  final bool isFromHome;
  const SearchScreen({this.isFromHome = false, super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(),
        title: const Text(
          "Search",
          style: Kstyles.kAppBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("Top Searches", style: TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: List.generate(
                  _topSearches.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: FilterChip(
                      onSelected: (value) {},
                      side: const BorderSide(color: KColors.primaryColor),
                      backgroundColor: KColors.whiteColor,
                      label: Text(
                        _topSearches[index],
                        style: Kstyles.kSmallTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                      // onSelected: (v) {},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Browse Categories",
                style: Kstyles.kHeadingTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: KColors.blackColor,
                  fontSize: 22,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.computer,
                    color: KColors.primaryColor,
                  ),
                  title: Text(
                    _categories[index],
                    style: Kstyles.kSmallTextStyle,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: KColors().greyColor,
                    size: 20,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> _categories = [
  'Python',
  'Dart',
  'Flutter',
  'Java',
  'Sql',
  'Digital Marketting',
  'React Js',
  'React Native',
  'Javascript',
  'C#',
  'C',
  "C++",
  "Ruby",
  "Excel",
  "AWS"
];

final List<String> _topSearches = [
  'Python',
  'Dart',
  'Flutter',
  'Java',
  'Sql',
  'Digital Marketting',
  'React Js',
  'React Native',
  'Javascript',
  'C#',
  'C',
  "C++",
  "Ruby",
  "Excel",
  "AWS"
];
