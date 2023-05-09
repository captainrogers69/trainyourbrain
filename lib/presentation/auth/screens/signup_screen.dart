import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/components/buttons/k_button.dart';
import 'package:trainyourbrain/components/buttons/k_icon_button.dart';
import 'package:trainyourbrain/components/k_dividers.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/components/textfields/login_textfield.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/presentation/providers/auth_provider.dart';
import 'package:trainyourbrain/utils/constants/container_util.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class SignUpScreen extends StatefulWidget {
  static const id = KRoutes.signUpScreen;
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, __, ___) {
        return Scaffold(
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
                        const Align(
                          alignment: Alignment.topLeft,
                          child: BackButton(),
                        ),
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
                        const SizedBox(height: 5),
                        const Text(
                          "Your Name",
                          style: Kstyles.kSubHeadingStyle,
                        ),
                        LoginTextfield(
                          controller: _userName,
                          hintText: "Enter your name",
                          secureIt: false,
                          asset: KAssets.user2,
                        ),
                        // const SizedBox(height: 5),
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
                              Provider.of<AuthProvider>(context, listen: false)
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Provider.of<AuthProvider>(context, listen: false)
                                .configRememberMe();
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Checkbox(
                                  value: __.rememberMe,
                                  activeColor: KColors.primaryColor,
                                  onChanged: (v) {
                                    FocusScope.of(context).unfocus();
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .configRememberMe();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: witRadiusSmall,
                                  ),
                                ),
                              ),
                              const Sbw(w: 4),
                              Text(
                                "Remember Me",
                                style: Kstyles.kSmallTextStyle.copyWith(
                                  color: __.rememberMe
                                      ? KColors.primaryColor
                                      : KColors().midGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Sbh(h: 4),
                    KButton(
                      buttonName: "Sign Up Securely",
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
                          "Already have an account?",
                          style: Kstyles.kSmallTextStyle,
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigate.instance.pushBack();
                          },
                          child: Text(
                            "Sign In",
                            style: Kstyles.kSmallTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: KColors.brandingColor,
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
        );
      },
    );
  }
}
