import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/trainyourbrain_logo.dart';
import 'package:trainyourbrain/presentation/home/compo/notification_compo.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

import '../../config/router/nav_service.dart';
import '../../utils/constants/k_colors.dart';
import '../../utils/constants/k_routes.dart';
import '../../utils/constants/kstyles.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const HomeAppBar({required this.drawerKey, super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(
        size.height * 0.045 + AppBar().preferredSize.height,
      );
}

class _HomeAppBarState extends State<HomeAppBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColors.primaryColor,
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.only(right: 35),
        child: TrainYourBrainLogo(),
      ),
      leading: RotatedBox(
        quarterTurns: 1,
        child: IconButton(
          onPressed: () {
            widget.drawerKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.bar_chart_rounded,
            color: KColors.whiteColor,
          ),
        ),
      ),
      actions: const [NotificationCompo(length: 5)],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigate.instance.navigateTo(
                    KRoutes.searchScreen,
                  );
                },
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: KColors.whiteColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: searchController,
                    enabled: false,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // borderSide: const BorderSide(
                        //   color: KColors.blackColor,
                        // ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: KColors.primaryColor,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          color: KColors.primaryColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: 4),
                      hintText: "Search Course, Instructor, Ebooks",
                      hintStyle: Kstyles.kSmallTextStyle.copyWith(
                        color: KColors().greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
