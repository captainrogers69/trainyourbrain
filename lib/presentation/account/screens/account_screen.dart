import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';

class AccountScreen extends StatelessWidget {
  static const id = KRoutes.accountScreen;
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("account screen"),
        ],
      ),
    );
  }
}
