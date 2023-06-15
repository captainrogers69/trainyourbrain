import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../config/router/nav_service.dart';
import '../../../utils/constants/container_util.dart';
import '../../../utils/constants/k_routes.dart';

class NotificationCompo extends StatelessWidget {
  final int length;
  const NotificationCompo({
    required this.length,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Stack(
        children: [
          IconButton(
            onPressed: () async {
              Navigate.instance.navigateTo(
                KRoutes.notificationScreen,
              );
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                KAssets.notification,
                color: KColors.whiteColor,
                scale: 3.5,
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: KColors().darkGreyColor),
                borderRadius: witRadiusCircular,
                color: KColors.whiteColor,
              ),
              alignment: Alignment.center,
              child: Text(
                length.toString(),
                style: Kstyles.kVerySmallTextStyle.copyWith(
                  color: KColors().darkGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
