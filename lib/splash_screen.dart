import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:trainyourbrain/components/transition_layer.dart';
import 'package:trainyourbrain/presentation/auth/screens/welcome_screen.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    splashTransition();
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  Widget build(BuildContext context) {
    // final h = size.height;
    // final w = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? size.height / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? size.height
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? size.width
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                color: _b ? Colors.white : Colors.transparent,
                // shape: _c? BoxShape.rectangle : BoxShape.circle,
                borderRadius:
                    _d ? const BorderRadius.only() : BorderRadius.circular(15),
              ),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Train Your Brain',
                            duration: const Duration(milliseconds: 1700),
                            textStyle: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  splashTransition() {
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(
      const Duration(milliseconds: 3850),
      () {
        setState(
          () {
            Navigator.of(context).pushReplacement(
              ThisIsFadeRoute(
                route: const WelcomeScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
