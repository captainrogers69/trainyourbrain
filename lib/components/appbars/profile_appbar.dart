import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/k_cache_image.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../config/router/nav_service.dart';
import '../../domain/models/data_models/user_model.dart';
import '../../utils/constants/container_util.dart';
import '../../utils/responsive/size_config.dart';
import '../pick_picture_sheet.dart';

class ProfileAppbar extends StatelessWidget {
  final UserModel user;
  const ProfileAppbar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 235,
      pinned: true,
      backgroundColor: KColors.whiteColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            KCacheImage(
              image:
                  'https://firebasestorage.googleapis.com/v0/b/wit---app.appspot.com/o/banners%2FFB_IMG_1669789524879.jpg?alt=media&token=54b89bbc-7811-4b30-8495-d3aa33d491b9',
              roundCorner: 1,
              height: 220,
              width: size.width,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: 146,
              left: 8,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 62.5,
                    backgroundColor: KColors().greyColor,
                    child: CircleAvatar(
                      radius: 60,
                      child: KCacheImage(
                        image: user.profileImgMain!,
                        fit: BoxFit.fill,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -5,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: roundedShapeStan,
                          builder: (context) => PickPictureSheet(
                            onCamera: () {
                              //   Provider.of<UserProvider>(context, listen: false)
                              //       .configCustomerPic(context, false);
                            },
                            onGallery: () {
                              //   Provider.of<UserProvider>(context, listen: false)
                              //       .configCustomerPic(context, true);
                            },
                          ),
                        );
                      },
                      icon: Image.asset(
                        KAssets.camera,
                        scale: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 220,
              right: 15,
              child: TextButton(
                onPressed: () {
                  Navigate.instance.navigateTo(
                    KRoutes.editprofileScreen,
                    args: user,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: KColors.primaryColor),
                    borderRadius: witRadiusStan,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Edit Profile',
                    style: Kstyles.kSmallTextStyle.copyWith(
                      color: KColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // leading: const BackButton(color: KColors.whiteColor),
    );
  }
}
