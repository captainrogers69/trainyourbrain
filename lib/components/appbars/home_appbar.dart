import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/trainyourbrain_logo.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(
        size.height * 0.005 + AppBar().preferredSize.height,
      );
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const TrainYourBrainLogo(),
      actions: const [
        // TextButton(
        //   onPressed: () {},
        //   child: Row(
        //     children: [
        //       Text(
        //         "captainrogers",
        //         style: kVerySmallTextStyle.copyWith(
        //           color: whiteColor,
        //         ),
        //       ),
        //       // sbw(5),
        //       // Transform.rotate(
        //       //   angle: -pi / 2,
        //       //   child: Icon(
        //       //     Icons.arrow_back_ios,
        //       //     color: whiteColor,
        //       //     size: 11.5,
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
