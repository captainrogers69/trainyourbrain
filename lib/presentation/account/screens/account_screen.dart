import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/data/data_images.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../components/k_cache_image.dart';
import '../../../components/sizing_box.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/responsive/size_config.dart';

class AccountScreen extends StatelessWidget {
  static const id = KRoutes.accountScreen;
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Your Account",
          style: Kstyles.kAppBarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Confirm Exit"),
                content: const Text("Are you sure you want to sign out ?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigate.instance.pushBack();
                    },
                    child: const Text(
                      "Cancel",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigate.instance.pushBack();
                    },
                    child: const Text(
                      "Sign Out",
                    ),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.logout,
            color: KColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // final refreshToken = ref
              //     .read(firebaseAuthProvider)
              //     .currentUser!
              //     .getIdToken()
              //     .then((value) => print(value));
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: KColors.blackColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Sbh(h: 8),
            CircleAvatar(
              radius: 60,
              child: KCacheImage(
                image: dataUser,
                fit: BoxFit.fill,
                height: 130,
                width: 130,
              ),
            ),
            const Sbh(h: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mayank Yadav".toUpperCase(),
                  style: Kstyles.kMediumTextStyle,
                )
              ],
            ),
            const Sbh(h: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "myyadavmayank1998@gmail.com",
                  style: Kstyles.kSmallTextStyle,
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
