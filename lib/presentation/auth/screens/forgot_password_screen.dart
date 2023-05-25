import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const id = KRoutes.forgotPasswordScreen;
  final String email;
  const ForgotPasswordScreen({required this.email, super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(),
    );
  }
}
