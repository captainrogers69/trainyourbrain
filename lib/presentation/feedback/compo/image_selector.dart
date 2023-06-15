import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/k_cache_image.dart';
import 'package:trainyourbrain/data/data_images.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';

import '../../../components/pick_picture_sheet.dart';
import '../../../utils/constants/container_util.dart';
import '../../../utils/responsive/size_config.dart';

class ImageSelector extends StatelessWidget {
  final void Function() onCamera, onGallery;
  final String? cloudImage;
  final File? image;
  final bool? useAvatar;
  const ImageSelector({
    required this.onGallery,
    required this.onCamera,
    this.useAvatar = true,
    this.cloudImage,
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return useAvatar!
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 62.5,
                    backgroundColor: KColors().midGreyColor,
                    child: CircleAvatar(
                      radius: 60,
                      child: image == null && cloudImage == null
                          ? KCacheImage(
                              image: dataUser,
                              fit: BoxFit.fill,
                              height: 120,
                              width: 120,
                            )
                          : image != null
                              ? ClipRRect(
                                  borderRadius: witRadiusCircular,
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.fill,
                                    height: 120,
                                    width: 120,
                                  ),
                                )
                              : KCacheImage(
                                  image: cloudImage!,
                                  fit: BoxFit.fill,
                                  height: 120,
                                  width: 120,
                                ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 3,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: KColors.primaryColor,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: roundedShapeStan,
                            isScrollControlled: true,
                            builder: (context) => PickPictureSheet(
                              onGallery: onGallery,
                              onCamera: onCamera,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: KColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: roundedShapeStan,
                isScrollControlled: true,
                builder: (context) => PickPictureSheet(
                  onGallery: onGallery,
                  onCamera: onCamera,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: witRadiusSmall,
                boxShadow: witBoxShadow,
                color: KColors.blackColor,
              ),
              width: size.width,
              height: 140,
              // padding: const EdgeInsets.symmetric(horizontal: 8),
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              child: image == null && cloudImage == null
                  ? const Icon(
                      Icons.camera_alt,
                      color: KColors.whiteColor,
                    )
                  : image != null
                      ? ClipRRect(
                          borderRadius: witRadiusSmall,
                          child: Image.file(
                            image!,
                            fit: BoxFit.fill,
                            // height: 120,
                            // width: 120,
                          ),
                        )
                      : KCacheImage(
                          image: cloudImage!,
                          fit: BoxFit.fill,
                          roundCorner: 1,
                          // height: 120,
                          // width: 120,
                        ),
            ),
          );
  }
}
