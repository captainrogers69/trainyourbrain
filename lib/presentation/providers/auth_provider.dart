import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class AuthProvider with ChangeNotifier {
  /// password visibility
  bool _visiblePassword = true;
  bool get visiblePassword => _visiblePassword;

  void configVisiblePassword({bool? vbb}) {
    if (vbb != null) {
      _visiblePassword = vbb;
    } else {
      _visiblePassword = !_visiblePassword;
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  /// check remember me
  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  void configRememberMe() {
    _rememberMe = !_rememberMe;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
