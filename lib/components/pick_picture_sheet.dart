import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/drag_handle.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

class PickPictureSheet extends StatelessWidget {
  final Function()? onCamera, onGallery, onViewImage;
  final Widget? addtionalWidget;
  final bool? pickingVideo;
  const PickPictureSheet({
    this.pickingVideo = false,
    required this.onGallery,
    required this.onCamera,
    this.addtionalWidget,
    this.onViewImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DragHandle(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              pickingVideo! ? "Select Video" : "Select Picture",
              style: Kstyles.kAppBarTextStyle,
            ),
          ),
          const Sbh(h: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   onPressed: onCamera,
                    //   icon: Image.asset(
                    //     Assets.camera,
                    //     scale: 15,
                    //     // Icons.camera,
                    //     // size: 30,
                    //     color: primaryColor,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: KColors.primaryColor,
                      radius: 37,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: onCamera,
                          icon: const Icon(
                            Icons.camera,
                            size: 30,
                            color: KColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Camera",
                      style: Kstyles.kAppBarTextStyle.copyWith(
                        color: KColors.primaryColor,
                        // fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   onPressed: onCamera,
                    //   icon: Image.asset(
                    //     Assets.gallery,
                    //     scale: 16,
                    //     // Icons.camera,
                    //     // size: 30,
                    //     color: primaryColor,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: KColors.primaryColor,
                      radius: 37,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: onGallery,
                          icon: const Icon(
                            Icons.image,
                            size: 30,
                            color: KColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Gallery",
                      style: Kstyles.kAppBarTextStyle.copyWith(
                        color: KColors.primaryColor,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                onViewImage == null
                    ? const SizedBox()
                    : const SizedBox(width: 25),
                onViewImage == null
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: KColors.primaryColor,
                            radius: 37,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: onViewImage,
                                icon: const Icon(
                                  Icons.image,
                                  size: 30,
                                  color: KColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "View Image",
                            style: TextStyle(
                              color: KColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          onViewImage == null ? const SizedBox() : const Sbh(h: 10),
          addtionalWidget ?? const SizedBox(),
          const Sbh(h: 20),
          // images!.isNotEmpty
          //     ? SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Row(
          //           children: List.generate(
          //               images!.length,
          //               (index) => CarAddedImage(
          //                   imageUrl: images![index], onpressed: () {})),
          //         ),
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }
}
