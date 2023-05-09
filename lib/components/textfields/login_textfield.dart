import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffix;
  final IconData? icon;
  final String? asset;
  final bool secureIt;
  const LoginTextfield({
    required this.controller,
    required this.hintText,
    required this.secureIt,
    this.suffix,
    this.asset,
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: secureIt,
        style: Kstyles.kSmallTextStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon!,
                  color: KColors.blackColor,
                )
              : Image.asset(
                  asset!,
                  color: KColors.blackColor,
                  scale: 22,
                ),
          suffixIcon: suffix ?? const SizedBox(),
          hintText: hintText,
          hintStyle: Kstyles.kSmallTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: KColors.blackColor,
              width: 1.4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: KColors.blackColor,
              width: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
