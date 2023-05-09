import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/components/buttons/k_button.dart';
import 'package:trainyourbrain/components/buttons/k_icon_button.dart';
import 'package:trainyourbrain/components/k_dividers.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/components/textfields/login_textfield.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/presentation/auth/compo/reset_remember_button.dart';
import 'package:trainyourbrain/presentation/providers/auth_provider.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class SignInScreen extends StatefulWidget {
  static const id = KRoutes.signInScreen;
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  DateTime? _currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () async {
            DateTime now = DateTime.now();
            if (_currentBackPressTime == null ||
                now.difference(_currentBackPressTime!) >
                    const Duration(seconds: 2)) {
              _currentBackPressTime = now;
              Fluttertoast.showToast(msg: "Tap again");
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          // const Align(
                          //   alignment: Alignment.topLeft,
                          //   child: BackButton(),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: "login_asset",
                                child: Image.asset(
                                  KAssets.loginAsset,
                                  height: size.height * .33,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello There!",
                            style: Kstyles.kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 27,
                            ),
                          ),
                          // const SizedBox(height: 7),
                          const Text(
                            "Email",
                            style: Kstyles.kSubHeadingStyle,
                          ),
                          LoginTextfield(
                            controller: _email,
                            hintText: "Enter your email",
                            secureIt: false,
                            asset: KAssets.user2,
                          ),
                          // const SizedBox(height: 5),
                          const Text(
                            "Password",
                            style: Kstyles.kSubHeadingStyle,
                          ),
                          LoginTextfield(
                            asset: KAssets.password2,
                            controller: _password,
                            hintText: "Enter your password",
                            secureIt: __.visiblePassword,
                            suffix: IconButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .configVisiblePassword();
                              },
                              icon: Icon(
                                !__.visiblePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: KColors().greyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const Sbh(h: 10),
                      ResetRememberButton(email: _email.text),
                      const Sbh(h: 6),
                      KButton(
                        buttonName: "Login Securely",
                        fontSize: 20,
                        asset: KAssets.password2,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        width: size.width * .96,
                      ),
                      const Sbh(h: 15),
                      const KOrDivider(title: "Or Continue with"),
                      const Sbh(h: 10),
                      Visibility(
                        visible: Platform.isAndroid,
                        replacement: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            KIconButton(
                              asset: KAssets.googleIcon,
                              buttonName: "Google",
                              fontSize: 20,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              width: size.width * .45,
                            ),
                            KIconButton(
                              icon: FontAwesomeIcons.apple,
                              // KAssets.googleIcon,
                              buttonName: "Apple",
                              fontSize: 20,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              width: size.width * .45,
                            ),
                          ],
                        ),
                        child: KIconButton(
                          asset: KAssets.googleIcon,
                          buttonName: "Continue with Google",
                          fontSize: 20,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          width: size.width * .96,
                        ),
                      ),
                      const Sbh(h: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: Kstyles.kSmallTextStyle,
                          ),
                          const Sbw(w: 10),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigate.instance
                                  .navigateTo(KRoutes.signUpScreen);
                            },
                            child: Text(
                              "Sign up",
                              style: Kstyles.kSmallTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
