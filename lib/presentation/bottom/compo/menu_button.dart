import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';

class MenuButton extends StatelessWidget {
  final ValueChanged<Artboard> riveOnInit;
  final VoidCallback press;
  const MenuButton({
    required this.riveOnInit,
    required this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: RiveAnimation.asset(
            KAssets.riveMenu,
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
