import 'package:rive/rive.dart';

class RiveModel {
  final String stateMachineName;
  final String artboard;
  late SMIBool? status;
  final String src;
  RiveModel({
    required this.stateMachineName,
    required this.artboard,
    required this.src,
    this.status,
  });

  set setStatus(SMIBool state) {
    status = state;
  }
}

class Menu {
  final String title;
  final RiveModel rive;
  final void Function()? onTap;
  Menu({
    required this.title,
    required this.rive,
    required this.onTap,
  });
}
