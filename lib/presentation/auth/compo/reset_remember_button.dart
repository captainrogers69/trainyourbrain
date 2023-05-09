import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/presentation/providers/auth_provider.dart';
import 'package:trainyourbrain/utils/constants/container_util.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/widget_utils/toasting.dart';

class ResetRememberButton extends StatelessWidget {
  final String email;
  const ResetRememberButton({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, __, ___) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                            Provider.of<AuthProvider>(context, listen: false)
                                .configRememberMe();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: witRadiusSmall,
                          ),
                        ),
                      ),
                      const Sbw(w: 4),
                      Text(
                        "Remember",
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
            TextButton(
              onPressed: () {
                if (email.isEmpty) {
                  toasting(
                    context: context,
                    style: ToastStyle.error,
                    message: "Please Enter Your Registered Email",
                  );
                } else {
                  FocusScope.of(context).unfocus();
                  Navigate.instance.navigateTo(
                    KRoutes.forgotPasswordScreen,
                    args: email,
                  );
                }
              },
              child: Text(
                "Forgot Password ?",
                style: Kstyles.kSmallTextStyle.copyWith(
                  color: KColors.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
