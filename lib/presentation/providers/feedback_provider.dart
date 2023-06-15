import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:trainyourbrain/config/router/nav_service.dart';
import 'package:trainyourbrain/utils/extensions/image_extension.dart';
import 'package:trainyourbrain/utils/widget_utils/toasting.dart';

import '../../utils/constants/button_state.dart';

class FeedbackProvider with ChangeNotifier {
  List _selectedRating = [];
  List get selectedRating => _selectedRating;

  final Navigate _nav = Navigate.instance;

  void configRating(int vvvb) {
    _selectedRating = [];
    _selectedRating.addAll(List.generate(vvvb + 1, (inde) => inde));
    notifyListeners();
  }

  List _selectedImproves = [];
  List get selectedImproves => _selectedImproves;
  void configImproves(String vvvb) {
    if (_selectedImproves.contains(vvvb)) {
      _selectedImproves.remove(vvvb);
    } else {
      _selectedImproves.add(vvvb);
    }
    // _selectedImproves = [];
    // _selectedRating.addAll(List.generate(vvvb + 1, (inde) => inde));
    notifyListeners();
  }

  void ttr() {
    _selectedImproves = [];
  }

  File? _selectedImg;
  File? get selectedImg => _selectedImg;

  Future<void> configFile(bool gallery) async {
    _nav.pushBack();
    _selectedImg = await pickNewImage(gallery: gallery);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  void clearFeedback() {
    // _selectedImg = null;
    _selectedImproves = [];
    _selectedRating = [];
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  ButtonState _reviewButtonState = ButtonState.idle;
  ButtonState get reviewButtonState => _reviewButtonState;

  void configReviewButtonState(ButtonState vvc) {
    _reviewButtonState = vvc;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  bool _fetchingFeedbacks = true;
  bool get fetchingFeedbacks => _fetchingFeedbacks;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> _allFeedbacks = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> get allFeedbacks =>
      _allFeedbacks;

  Future<void> fetchFeedbacks() async {
    _fetchingFeedbacks = true;
    _allFeedbacks = [];

    _fetchingFeedbacks = false;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  Future<void> createFeedback(
      {required String fd, required BuildContext context}) async {
    configReviewButtonState(ButtonState.processing);
    try {
      // String tempUrl = '';
      // if (_selectedImg != null) {
      //   String imageName = await RandomIdGenerator().getDigitsID(10);
      //   tempUrl = await uploadToFirebaseStorage(
      //     collection: "feedbacks${_partner!.partnerId}",
      //     uploadable: _selectedImg!,
      //     imageName: imageName,
      //   );
      // }
      // final temo = FeedbackModel(
      //   thoughts: fd,
      //   imageUrl: tempUrl,
      //   ratings: _selectedRating,
      //   improves: _selectedImproves,
      //   createdAt: Timestamp.now(),
      //   querySolved: false,
      //   responseDone: false,
      //   empId: _employee!.employeeId,
      //   partnerId: _partner!.partnerId,
      // );
      // _streams.feedbackQuery
      //     .collection(_partner!.partnerId!)
      //     .doc()
      //     .set(temo.toMap());

      configReviewButtonState(ButtonState.idle);
      _nav.pushBack();
      toasting(context: context, message: "Your feedback has been submitted");
    } catch (e) {
      configReviewButtonState(ButtonState.processing);
      toasting(
          context: context, style: ToastStyle.error, message: e.toString());
    }
  }

  //////////////////////////////////////////////
  ///  notification
  bool _fetchingNotifications = false;
  bool get fetchingNotifications => _fetchingNotifications;

  List _allNotifications = [];
  List get allNotifications => _allNotifications;

  Future<void> fetchNotifications() async {
    _fetchingNotifications = true;
    _allNotifications = [];
    _fetchingNotifications = false;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      NotificationListener;
    });
  }
}
