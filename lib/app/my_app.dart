import 'package:trainyourbrain/config/router/app_router.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/config/theme/app_theme.dart';
import 'package:trainyourbrain/presentation/bottom/screens/bottom_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Me',
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      navigatorKey: Navigate.instance.navigationKey,
      home: const BottomScreen(),
    );
  }
}
