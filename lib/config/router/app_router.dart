import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainyourbrain/domain/models/data_models/course_model.dart';
import 'package:trainyourbrain/presentation/auth/screens/welcome_screen.dart';
import 'package:trainyourbrain/presentation/auth/screens/signin_screen.dart';
import 'package:trainyourbrain/presentation/auth/screens/signup_screen.dart';
import 'package:trainyourbrain/presentation/courses/course_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings route) {
    const PageTransitionType pageStyle = PageTransitionType.rightToLeft;

    switch (route.name) {
      case WelcomeScreen.id:
        return PageTransition(child: const WelcomeScreen(), type: pageStyle);
      case SignInScreen.id:
        return PageTransition(child: const SignInScreen(), type: pageStyle);
      case SignUpScreen.id:
        return PageTransition(child: const SignUpScreen(), type: pageStyle);
      case CourseScreen.id:
        CourseItem yut = route.arguments as CourseItem;
        return PageTransition(
            child: CourseScreen(course: yut), type: pageStyle);
      default:
        return PageTransition(child: const TempError(), type: pageStyle);
    }
  }
}

class TempError extends StatelessWidget {
  const TempError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("404! Something went wrong!"),
      ),
    );
  }
}
