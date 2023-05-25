import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../utils/responsive/size_config.dart';
import '../sizing_box.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  const SearchAppBar({
    required this.searchController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: secondColor,

      // leading: BackButton(color: whiteColor),
      title: Row(
        children: [
          Flexible(
            child: Container(
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: KColors.whiteColor,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: searchController,
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: KColors.primaryColor,
                  ),
                  hintText: "Search Course, Instructor, Ebooks",
                  hintStyle: Kstyles.kSmallTextStyle.copyWith(
                    color: KColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const Sbw(w: 8),
          const Icon(
            Icons.shopping_cart,
            color: KColors.primaryColor,
          ),
        ],
      ),

      // backgroundColor: secondColor,
      // automaticallyImplyLeading: isFromHome,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        size.height * 0.005 + AppBar().preferredSize.height,
      );
}
