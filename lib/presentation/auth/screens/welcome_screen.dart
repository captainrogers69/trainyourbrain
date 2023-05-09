import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/buttons/k_border_button.dart';
import 'package:trainyourbrain/components/buttons/k_button.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = KRoutes.welcomeScreen;
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Train Your Brain",
              //   style: Kstyles.kSubHeadingStyle.copyWith(
              //     fontSize: 30,
              //   ),
              // ),
              Image.asset(
                KAssets.landingAssets,
                width: size.width,
                height: 400,
              ),
              // const Spacer(),
              const Sbh(h: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Discover best way to practice here",
                          style: Kstyles.kHeadingTextStyle,
                        ),
                        const Sbh(h: 20),
                        Text(
                          "Explore all the most exciting practice sets and courses based on your interests and study majors",
                          textAlign: TextAlign.center,
                          style: Kstyles.kAppBarTextStyle.copyWith(
                            color: KColors().midGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KButton(
                        buttonName: "Sign In",
                        onTap: () {
                          Navigate.instance
                              .pushAndRemoveUntil(KRoutes.signInScreen);
                        },
                        height: 60,
                        useRoundCorner: true,
                        fontSize: 23,
                        width: size.width * .95,
                      ),
                      const Sbh(h: 10),
                      KBorderButton(
                        buttonName: "Create an account",
                        onTap: () {
                          Navigate.instance.navigateTo(KRoutes.signUpScreen);
                        },
                        useRoundCorner: true,
                        height: 60,
                        fontSize: 23,
                        width: size.width * .95,
                      ),
                    ],
                  ),
                  /* Container(
                    height: 46,
                    width: size.width * .72,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: KColors().lightlightGreyColor,
                      borderRadius: witRadiusSmall,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigate.instance.navigateTo(KRoutes.signUpScreen);
                          },
                          splashColor: KColors().transparentColor,
                          highlightColor: KColors().transparentColor,
                          child: Container(
                            height: 46,
                            width: size.width * .35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: witRadiusSmall,
                              color: KColors.whiteColor,
                            ),
                            child: const Text(
                              "Register",
                              style: Kstyles.kAppBarTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigate.instance
                                .pushAndRemoveUntil(KRoutes.signInScreen);
                          },
                          splashColor: KColors().transparentColor,
                          highlightColor: KColors().transparentColor,
                          child: Container(
                            height: 46,
                            width: size.width * .35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: witRadiusStan,
                              color: KColors().lightlightGreyColor,
                            ),
                            child: const Text(
                              "Sign In",
                              style: Kstyles.kAppBarTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), */
                ],
              ),
              Sbh(h: size.height * .05)
            ],
          ),
        ),
      ),
    );
  }
}
