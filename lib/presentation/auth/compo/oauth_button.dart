import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';

class OAuthButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const OAuthButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // width: size.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: KColors().midGreyColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            icon,
            color: KColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
