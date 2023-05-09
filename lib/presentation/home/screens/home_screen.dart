import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/appbars/home_appbar.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';

class HomeScreen extends StatefulWidget {
  static const id = KRoutes.homeScreen;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("home screen"),
        ],
      ),
    );
  }
}
