// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:chatme/config/router/nav_service.dart';
// import 'package:image_picker/image_picker.dart';
// import '../widget_utils/toasting.dart';
// import 'dart:developer';
// import 'dart:io';

import 'dart:developer';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/utils/widget_utils/toasting.dart';

// extension FileExtension on File {
//   /// to compress image
Future<File> getCompressedImage(
    {required File ogFile, required String targetPath}) async {
  XFile? result = await FlutterImageCompress.compressAndGetFile(
      ogFile.absolute.path, targetPath,
      quality: 88);
  File tempFile = File(result!.path);
  log("${ogFile.lengthSync()}orignal length");
  log("${tempFile.lengthSync()}result length");
  return tempFile;
}

/// to pick new image
Future<File?> pickNewImage({bool gallery = false}) async {
  File? primeImage;
  ImagePicker picker = ImagePicker();
  PickedFile? pickedFile;

  if (gallery) {
    pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
  } else {
    pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );
  }

  if (pickedFile != null) {
    var bytes = File(pickedFile.path);
    var enc = await bytes.readAsBytes();
    log("${enc.lengthInBytes} 5555555555555555555555");
    if (enc.lengthInBytes > 37000) {
      File t = await getCompressedImage(
        ogFile: File(pickedFile.path),
        targetPath: "${pickedFile.path}kk.jpeg",
      );
      primeImage = t;
      toasting(
        context: Navigate.instance.navigationKey.currentState!.overlay!.context,
        message: "Selected successfully",
      );
    } else {
      primeImage = File(pickedFile.path);
      toasting(
          context:
              Navigate.instance.navigationKey.currentState!.overlay!.context,
          message: "Selected successfully");
    }
  } else {
    toasting(
        context: Navigate.instance.navigationKey.currentState!.overlay!.context,
        style: ToastStyle.error,
        message: "No Image Selected!");
  }
  if (primeImage == null) {
    return null;
  } else {
    return primeImage;
  }
}

//   /// video pick
//   Future<File> pickNewVideo(bool gallery) async {
//     File? primeVideo;
//     ImagePicker picker = ImagePicker();
//     PickedFile? pickedFile;

//     if (gallery) {
//       pickedFile = await picker.getVideo(
//         source: ImageSource.gallery,
//       );
//     } else {
//       pickedFile = await picker.getVideo(
//         source: ImageSource.camera,
//       );
//     }

//     if (pickedFile != null) {
//       primeVideo = File(pickedFile.path);
//       toasting(
//           context:
//               Navigate.instance.navigationKey.currentState!.overlay!.context,
//           message: "Selected successfully");
//     } else {
//       toasting(
//           context:
//               Navigate.instance.navigationKey.currentState!.overlay!.context,
//           style: ToastStyle.error,
//           message: "No Video Selected!");
//     }
//     return primeVideo!;
//   }
// }
