import 'package:flutter/material.dart';

class L10n {
  static final allLang = [
    const Locale('en', 'US'),
    const Locale('hi', 'IN'),
    const Locale('te', 'IN')
  ];
  static List<LanguageInfo> langInfoData = [
    LanguageInfo(asset: '', title: 'English'),
    LanguageInfo(asset: '', title: 'हिन्दी'),
    LanguageInfo(asset: '', title: 'తెలుగు'),
  ];
}

class LanguageInfo {
  final String title;
  final String asset;
  LanguageInfo({
    required this.asset,
    required this.title,
  });
}
