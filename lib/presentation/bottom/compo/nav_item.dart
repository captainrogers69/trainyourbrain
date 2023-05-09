import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:trainyourbrain/domain/models/function_models/rive_model.dart';
import 'package:trainyourbrain/presentation/bottom/compo/animated_bar.dart';

class NavItem extends StatelessWidget {
  final ValueChanged<Artboard> riveOnInit;
  final VoidCallback press;
  final Menu selectedNav;
  final Menu navBar;
  const NavItem({
    required this.selectedNav,
    required this.riveOnInit,
    required this.navBar,
    required this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: RiveAnimation.asset(
                navBar.rive.src,
                artboard: navBar.rive.artboard,
                onInit: riveOnInit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
