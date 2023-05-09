import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rive/rive.dart';
import 'package:trainyourbrain/domain/models/function_models/rive_model.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';

enum BottomStates { home, search, user }

class BottomProvider with ChangeNotifier {
  ValueNotifier<Menu> _selectedBottom = ValueNotifier(
    Menu(
      title: "Home",
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "HOME",
        stateMachineName: "HOME_interactivity",
      ),
    ),
  );
  ValueNotifier<Menu> get selectedBottom => _selectedBottom;

  void configSelectedBottom(Menu vvc) {
    _selectedBottom = ValueNotifier(
      Menu(
        title: BottomStates.home.name,
        rive: RiveModel(
          src: KAssets.riveAssets,
          artboard: "HOME",
          stateMachineName: "HOME_interactivity",
        ),
      ),
    );
    _selectedBottom.value = vvc;
    configScreen(vvc);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  final ValueNotifier<int> _selectedScreen = ValueNotifier<int>(0);
  ValueNotifier<int> get selectedScreen => _selectedScreen;

  void configScreen(Menu menu) {
    final menuTitle = menu.title;
    if (_selectedBottom.value != menu) {
      _selectedBottom.value = menu;
    }
    switch (menuTitle) {
      case "home":
        _selectedScreen.value = 0;
        break;
      case "search":
        _selectedScreen.value = 1;
        break;
      case "user":
        _selectedScreen.value = 2;
        break;
      default:
    }
  }

  final ValueNotifier<bool> _menuToggler = ValueNotifier<bool>(false);
  ValueNotifier<bool> get menuToggler => _menuToggler;

  void configToggler(bool vvc) {
    _menuToggler.value = vvc;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  SMIBool? _isMenuOpenInput;
  SMIBool? get isMenuOpenInput => _isMenuOpenInput;

  void configMenuInput({StateMachineController? tret}) {
    if (tret != null) {
      _isMenuOpenInput = tret.findInput<bool>("isOpen") as SMIBool;
      _isMenuOpenInput!.value = true;
    } else {
      // _isMenuOpenInput = controller.findInput<bool>("isOpen") as SMIBool;
      _isMenuOpenInput!.value = !_isMenuOpenInput!.value;
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  Menu _selectedSideMenu = Menu(
    title: BottomStates.home.name,
    rive: RiveModel(
      src: KAssets.riveAssets,
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
  );
  Menu get selectedSideMenu => _selectedSideMenu;

  void configSideMenu(Menu vvc) {
    _selectedSideMenu = vvc;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  ///////////////////////////// ================================

  final List<Menu> bottomNavItems = [
    Menu(
      title: BottomStates.home.name,
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "HOME",
        stateMachineName: "HOME_interactivity",
      ),
    ),
    Menu(
      title: BottomStates.search.name,
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity",
      ),
    ),
    Menu(
      title: BottomStates.user.name,
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "USER",
        stateMachineName: "USER_Interactivity",
      ),
    ),
  ];

  List<Menu> sidebarMenus = [
    Menu(
      title: BottomStates.home.name,
      rive: RiveModel(
          src: KAssets.riveAssets,
          artboard: "HOME",
          stateMachineName: "HOME_interactivity"),
    ),
    Menu(
      title: BottomStates.search.name,
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity",
      ),
    ),
    Menu(
      title: "Favorites",
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity",
      ),
    ),
    Menu(
      title: "Help",
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity",
      ),
    ),
  ];
  List<Menu> sidebarMenus2 = [
    Menu(
      title: "History",
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity",
      ),
    ),
    Menu(
      title: "Notifications",
      rive: RiveModel(
        src: KAssets.riveAssets,
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity",
      ),
    ),
  ];
}
