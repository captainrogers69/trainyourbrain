// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'dart:developer';
// import 'dart:convert';
// import 'dart:io';

// extension FirestoreExtension on AsyncSnapshot {
//   bool isWaiting() {
//     return connectionState == ConnectionState.waiting;
//   }

//   bool isValid() {
//     return hasData && data != null;
//   }

//   bool noData(AsyncSnapshot daata) {
//     if (isValid()) {
//       return daata.data.docs.isEmpty;
//     } else {
//       return true;
//     }
//   }

//   bool notValid() {
//     return hasError && data == null;
//   }

//   Future<String> uploadToFirebaseStorage(
//       {required String collection,
//       required String imageName,
//       required File uploadable}) async {
//     String urlToReturn = '';
//     Reference firebaseStorageRef =
//         FirebaseStorage.instance.ref().child(collection).child(imageName);
//     final bytes = uploadable.readAsBytesSync();
//     String base64Encode(List<int> bytes) => base64.encode(bytes);
//     String b64 = base64Encode(bytes);
//     log("base 64: $b64 :base64");

//     /// uploading base 64 or file
//     // final UploadTask task = firebaseStorageRef.putFile(uploadable);
//     final UploadTask task = firebaseStorageRef.putString(
//         'data:text/plain;base64,$b64',
//         format: PutStringFormat.dataUrl);

//     await task.whenComplete(() async {
//       try {
//         urlToReturn = await firebaseStorageRef.getDownloadURL();
//       } catch (onError) {
//         log("Error:" '${onError.toString()}');
//       }
//       log(urlToReturn);
//     });
//     return urlToReturn;
//   }
// }
