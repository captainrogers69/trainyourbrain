import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _homeCrouselindex = 0;

  int get homeCrouselindex => _homeCrouselindex;

  List<String> homeCrouselImages = [
    'assets/imageAssets/banner1.png',
    'assets/imageAssets/banner2.png',
  ];

  void configHomeCrousel(int vvc) {
    _homeCrouselindex = vvc;
    notifyListeners();
  }
}
