import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:trainyourbrain/domain/models/function_models/rive_model.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';

class SideMenu extends StatelessWidget {
  final ValueChanged<Artboard> riveOnInit;
  final VoidCallback press;
  final Menu selectedMenu;
  final Menu menu;
  const SideMenu({
    required this.selectedMenu,
    required this.riveOnInit,
    required this.press,
    required this.menu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: selectedMenu == menu ? 288 : 0,
              height: 56,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: KColors.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  menu.rive.src,
                  artboard: menu.rive.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
