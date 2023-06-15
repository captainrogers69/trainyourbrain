import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:trainyourbrain/data/data_images.dart';
import 'package:trainyourbrain/domain/models/data_models/user_model.dart';

import '../../utils/extensions/image_extension.dart';

class UserProvider with ChangeNotifier {
  final UserModel _currentUser = UserModel(
      userName: 'Mayank456',
      profileImgMain: dataUser,
      bio: 'My name is Mayank yadav',
      profileName: 'Mayank Yadav');
  UserModel? get currentUser => _currentUser;

  File? _profileImg;
  File? get profileImg => _profileImg;

  Future<void> configFile(bool gallery) async {
    _profileImg = await pickNewImage(gallery: gallery);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
/////////////////////////////////////////////
  /// pick picture sheet
}
