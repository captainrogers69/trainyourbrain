import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/domain/models/function_models/rive_model.dart';
import 'package:trainyourbrain/presentation/account/screens/account_screen.dart';
import 'package:trainyourbrain/presentation/bottom/compo/nav_item.dart';
import 'package:trainyourbrain/presentation/bottom/compo/side_bar.dart';
import 'package:trainyourbrain/presentation/home/screens/home_screen.dart';
import 'package:trainyourbrain/presentation/providers/bottom_provider.dart';
import 'package:trainyourbrain/presentation/search/screens/search_screen.dart';
import 'package:trainyourbrain/utils/constants/container_util.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/rive/rive_utils.dart';

class BottomScreen extends StatefulWidget {
  static const id = KRoutes.bottomScreen;
  // static late SMIBool isMenuOpenInput;
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> animation1;

  late BottomProvider _bp;

  @override
  void initState() {
    super.initState();
    _bp = Provider.of<BottomProvider>(context, listen: false);
    _bp.configSelectedBottom(_bp.bottomNavItems.first);
    vfd();
  }

  void vfd() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bp = Provider.of<BottomProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(drawerKey: _drawerKey),
      const SearchScreen(),
      const AccountScreen(),
    ];
    return Consumer<BottomProvider>(
      builder: (_, __, ___) {
        return Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          key: _drawerKey,
          drawer: const SideBar(),
          body:
              // Stack(
              //   children: [
              // AnimatedPositioned(
              //   width: 288,
              //   height: MediaQuery.of(context).size.height,
              //   duration: const Duration(milliseconds: 200),
              //   curve: Curves.fastOutSlowIn,
              //   left: __.menuToggler.value ? 0 : -288,
              //   top: 0,
              //   child: const SideBar(),
              // ),
              // Transform(
              //   alignment: Alignment.center,
              //   transform: Matrix4.identity()
              //     ..setEntry(3, 2, 0.001)
              //     ..rotateY(1 * animation1.value -
              //         30 * (animation1.value) * pi / 180),
              //   child: Transform.translate(
              //     offset: Offset(animation1.value * 265, 0),
              //     child: Transform.scale(
              //       scale: scaleAnimation.value,
              //       child: ClipRRect(
              //         borderRadius: witRadiusSmall,
              //         child: InkWell(
              //           onTap: () {
              //             if (__.menuToggler.value) {
              //               __.menuToggler.value = false;
              //               Provider.of<BottomProvider>(context, listen: false)
              //                   .configMenuInput();
              //               animationController.reverse();
              //             }
              //           },
              // child: InkWell(
              //   onTap: () {
              //     if (__.menuToggler.value) {
              //       __.menuToggler.value = false;
              //       Provider.of<BottomProvider>(context,
              //               listen: false)
              //           .configMenuInput();
              //       // animationController.reverse();
              //     }
              //   },
              //   child:
              pages[__.selectedScreen.value],
          // ),
          //           child: IndexedStack(
          //             index: __.selectedScreen.value,
          //             children: _pages,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // AnimatedPositioned(
          //   duration: const Duration(milliseconds: 200),
          //   curve: Curves.fastOutSlowIn,
          //   left: __.menuToggler.value ? 220 : 0,
          //   top: 16,
          //   child: MenuButton(
          //     press: () {
          //       // isMenuOpenInput.value = !isMenuOpenInput.value;
          //       Provider.of<BottomProvider>(context, listen: false)
          //           .configMenuInput();

          //       if (animationController.value == 0) {
          //         animationController.forward();
          //       } else {
          //         animationController.reverse();
          //       }

          //       __.menuToggler.value = !__.menuToggler.value;
          //     },
          //     riveOnInit: (artboard) {
          //       final controller = StateMachineController.fromArtboard(
          //           artboard, "State Machine");
          //       artboard.addController(controller!);
          //       Provider.of<BottomProvider>(context, listen: false)
          //           .configMenuInput(tret: controller);
          //       // SMIBool _isMenuOpenInput = controller.findInput<bool>("isOpen") as SMIBool;
          //     },
          //   ),
          // ),
          //   ],
          // ),
          bottomNavigationBar:
              // __.menuToggler.value ? AnimatedContainer(
              // duration: const Duration(milliseconds: 300),
              // child: const SizedBox(),):
              Transform.translate(
            offset: Offset(0, 100 * animation1.value),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                decoration: BoxDecoration(
                  color: KColors.primaryColor, //.withOpacity(0.8),
                  borderRadius: witRadiusMid,
                  boxShadow: [
                    BoxShadow(
                      color: KColors.primaryColor.withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    __.bottomNavItems.length,
                    (index) {
                      Menu navBar = __.bottomNavItems[index];
                      return NavItem(
                        press: () {
                          RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                          Provider.of<BottomProvider>(context, listen: false)
                              .configSelectedBottom(navBar);
                        },
                        selectedNav: __.selectedBottom.value,
                        navBar: navBar,
                        riveOnInit: (artboard) {
                          navBar.rive.status = RiveUtils.getRiveInput(
                            stateMachineName: navBar.rive.stateMachineName,
                            artboard,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
