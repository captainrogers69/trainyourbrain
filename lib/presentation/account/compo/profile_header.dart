import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../domain/models/data_models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  const ProfileHeader({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.profileName ?? 'Complete Your Profile',
            style: Kstyles.kSmallTextStyle,
          ),
          Text(
            user.userName != '' ? "@${user.userName}" : "Set Your Username",
            style: Kstyles.kSmallTextStyle.copyWith(
              color: KColors().darkGreyColor,
            ),
          ),
          Text(
            user.userName != '' ? user.bio! : "Set Your Bio",
            // "Star_Wars • Harry_Potter😎 Core_comic_fan😋 Flutter_developer🥰 Whatever_it_takes!!😎",
            style: Kstyles.kSmallTextStyle
                .copyWith(color: KColors().darkGreyColor),
          ),
          Row(
            children: [
              const Icon(Icons.cake),
              const Sbw(w: 4),
              Text(
                'Born 16 October',
                style: Kstyles.kSmallTextStyle.copyWith(
                  color: KColors().darkGreyColor,
                ),
              ),
              const Sbw(w: 5),
              const Icon(Icons.location_on),
              const Sbw(w: 4),
              const Text(
                'Moradabad',
                style: Kstyles.kSmallTextStyle,
              )
              // Consumer<AddressProvider>(builder: (_, __, ___) {
              //   return Expanded(
              //     child: Text(
              //       __.primaryAddress != null
              //           ? __.primaryAddress!.completeAddress!
              //           : __.loadingLocation
              //               ? "....."
              //               : !__.givenGPSPermission
              //                   ? tr(LocaleKeys.home_turnYourGps)
              //                   : __.completeAddress,
              //       overflow: TextOverflow.ellipsis,
              //       style: Kstyles.kSmallTextStyle.copyWith(
              //         color: KColors().darkGreyColor,
              //       ),
              //     ),
              //   );
              // }),
            ],
          ),
        ],
      ),
    );
  }
}
