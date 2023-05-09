import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';

class SearchScreen extends StatelessWidget {
  static const id = KRoutes.searchScreen;
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("search screen"),
        ],
      ),
    );
  }
}
