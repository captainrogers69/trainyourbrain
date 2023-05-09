import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/utils/constants/button_state.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class KIconButton extends StatelessWidget {
  final ButtonState buttonState;
  final double? width, height, fontSize;
  final String? buttonName, asset;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool useRed, onlyIcon;
  const KIconButton({
    this.buttonState = ButtonState.idle,
    this.buttonName = "button name",
    this.onlyIcon = true,
    this.asset,
    this.icon,
    required this.onTap,
    this.useRed = false,
    this.fontSize = 13,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: useRed ? KColors.errorColor : KColors().darkGreyColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          onPressed: onTap,
          height: height ?? 45,
          minWidth: width ?? size.width * 0.35,
          color: KColors.whiteColor,
          elevation: 5,
          // splashColor: Colors.grey[100],
          // hoverColor: Colors.grey[100],
          highlightColor: Colors.grey[100],
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonState == ButtonState.processing
                ? [
                    const SpinKitThreeBounce(
                      color: KColors.primaryColor,
                      size: 20,
                    ),
                  ]
                : [
                    asset != null
                        ? Image.asset(
                            asset!,
                            scale: 1.6,
                          )
                        : Icon(icon, size: 30),
                    const Sbw(w: 10),
                    Text(
                      buttonName!,
                      style: Kstyles.kAppBarTextStyle.copyWith(
                        fontSize: fontSize,
                        color: useRed
                            ? KColors.errorColor
                            : KColors().darkGreyColor,
                      ),
                    ),
                  ],
          ),
        ),
        // child: Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       onlyIcon
        //           ? Text(
        //               buttonName!,
        //               style: Kstyles.kSmallTextStyle.copyWith(
        //                 color: KColors.whiteColor,
        //               ),
        //             )
        //           : const SizedBox(),
        //       onlyIcon ? const Sbw(w: 5) : const SizedBox(),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
