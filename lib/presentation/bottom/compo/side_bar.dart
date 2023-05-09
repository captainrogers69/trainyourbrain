import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/presentation/bottom/compo/info_card.dart';
import 'package:trainyourbrain/presentation/bottom/compo/side_menu.dart';
import 'package:trainyourbrain/presentation/providers/bottom_provider.dart';
import 'package:trainyourbrain/utils/constants/container_util.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/rive/rive_utils.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomProvider>(
      builder: (_, __, ___) {
        return Container(
          width: 288,
          height: double.infinity,
          decoration: BoxDecoration(
            color: KColors.primaryColor, //.withOpacity(0.8),
            borderRadius: witRadiusSmall,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoCard(
                    name: "Mayank Yadav",
                    bio: "Flutter Developer",
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                    child: Text(
                      "Browse".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white70),
                    ),
                  ),
                  ...__.sidebarMenus
                      .map((menu) => SideMenu(
                            menu: menu,
                            selectedMenu: __.selectedSideMenu,
                            press: () {
                              RiveUtils.chnageSMIBoolState(menu.rive.status!);
                              Provider.of<BottomProvider>(context,
                                      listen: false)
                                  .configSideMenu(menu);
                            },
                            riveOnInit: (artboard) {
                              menu.rive.status = RiveUtils.getRiveInput(
                                artboard,
                                stateMachineName: menu.rive.stateMachineName,
                              );
                            },
                          ))
                      .toList(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                    child: Text(
                      "History".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white70),
                    ),
                  ),
                  ...__.sidebarMenus2
                      .map(
                        (menu) => SideMenu(
                          menu: menu,
                          selectedMenu: __.selectedSideMenu,
                          press: () {
                            RiveUtils.chnageSMIBoolState(menu.rive.status!);
                            Provider.of<BottomProvider>(context, listen: false)
                                .configSideMenu(menu);
                          },
                          riveOnInit: (artboard) {
                            menu.rive.status = RiveUtils.getRiveInput(
                              artboard,
                              stateMachineName: menu.rive.stateMachineName,
                            );
                          },
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
