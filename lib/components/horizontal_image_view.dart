// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:wit_user/navigation_service.dart';
// import 'package:wit_user/utils/general_routes.dart';
// import 'package:wit_user/utils/theme_utils/wit_colors.dart';
// import 'package:wit_user/utils/widget_utils/wit_sized_box.dart';
// import 'package:wit_user/view/wit_components/wrappers/cache_image.dart';

// class HorizontalImageView extends StatelessWidget {
//   final List urls;
//   final List<File> files;
//   final int length;
//   final String warning;
//   final Function()? onTap;
//   const HorizontalImageView({
//     super.key,
//     required this.files,
//     this.onTap,
//     required this.warning,
//     required this.length,
//     required this.urls,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         onTap != null
//             ? InkWell(
//                 onTap: onTap,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(11),
//                     color: greyColor,
//                   ),
//                   width: 85,
//                   height: 90,
//                   child: const Center(
//                     child: Icon(Icons.add),
//                   ),
//                 ),
//               )
//             : const SizedBox(),
//         sbw(6),
//         length == 0
//             ? Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(warning),
//               )
//             : const SizedBox(),
//         Expanded(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [...hh()],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   hh() {
//     return List.generate(
//       length,
//       (index) => InkWell(
//         onTap: () {
//           if (urls.isNotEmpty) {
//             Navigation.instance.navigateTo(Routes.viewImage, args: {
//               'images': urls,
//               'index': index,
//             });
//           }
//         },
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           width: 85,
//           height: 90,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: urls.isEmpty
//                 ? Image.file(
//                     files[index],
//                     fit: BoxFit.fitWidth,
//                     width: 85,
//                     height: 90,
//                   )
//                 : CacheImage(
//                     image: urls[index]['image'],
//                     fit: BoxFit.fitWidth,
//                     roundCorner: 1,
//                     width: 85,
//                     height: 90,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
