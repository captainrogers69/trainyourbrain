import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/trainyourbrain_logo.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

import '../../utils/constants/k_colors.dart';
import '../../utils/constants/kstyles.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

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
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        // elevation: 1,
        title: const TrainYourBrainLogo(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: KColors.whiteColor,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: searchController,
                  enabled: false,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: KColors.blackColor,
                        width: 1.4,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: KColors.primaryColor,
                    ),
                    hintText: "Search Course, Instructor, Ebooks",
                    hintStyle: Kstyles.kSmallTextStyle.copyWith(
                      color: KColors().greyColor,
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
