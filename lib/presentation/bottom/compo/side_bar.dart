import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/components/k_cache_image.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/data/data_images.dart';
import 'package:trainyourbrain/presentation/bottom/compo/side_menu.dart';
import 'package:trainyourbrain/presentation/providers/bottom_provider.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/rive/rive_utils.dart';

class SideBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const SideBar({required this.drawerKey, super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomProvider>(
      builder: (_, __, ___) {
        return Drawer(
          backgroundColor: KColors.primaryColor,

          // child: Container(
          //   width: 288,
          //   height: double.infinity,
          //   decoration: BoxDecoration(
          //     color: KColors.primaryColor, //.withOpacity(0.8),
          //     borderRadius: witRadiusSmall,
          //   ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1516979187457-637abb4f9353?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 20),
                          child: CircleAvatar(
                            child: KCacheImage(
                              image: dataUser,
                            ),
                          ),
                        ),
                        const Sbh(h: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Mayank Agarwal',
                            style: Kstyles.kMediumTextStyle,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'rmudit5@gmail.com',
                            style: Kstyles.kSmallTextStyle,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 10, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...__.sidebarMenus
                  .map(
                    (menu) => SideMenu(
                      menu: menu,
                      selectedMenu: __.selectedSideMenu,
                      press: () {
                        // RiveUtils.chnageSMIBoolState(menu.rive.status!);
                        // Provider.of<BottomProvider>(context, listen: false)
                        //     .configSideMenu(menu);
                        widget.drawerKey.currentState!.closeDrawer();
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
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
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
                        // RiveUtils.chnageSMIBoolState(menu.rive.status!);
                        // Provider.of<BottomProvider>(context, listen: false)
                        //     .configSideMenu(menu);
                        widget.drawerKey.currentState!.closeDrawer();
                        menu.onTap!();
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
        );
      },
    );
  }
}
