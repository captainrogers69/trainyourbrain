import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:trainyourbrain/utils/constants/button_state.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class KBorderButton extends StatelessWidget {
  final double? width, height, fontSize;
  final ButtonState buttonState;
  final VoidCallback? onTap;
  final String? buttonName;
  final bool useRed,
      useGrey,
      useGreen,
      useRoundCorner,
      useMidRoundCorner,
      needIcon;
  const KBorderButton({
    this.buttonState = ButtonState.idle,
    this.useMidRoundCorner = true,
    this.useRoundCorner = false,
    this.useGreen = false,
    this.needIcon = false,
    this.useGrey = false,
    this.useRed = false,
    required this.onTap,
    this.fontSize = 13,
    this.buttonName,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: useGreen
                  ? KColors.switchColor
                  : useGrey
                      ? KColors().greyColor
                      : useRed
                          ? KColors.errorColor
                          : KColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              useRoundCorner
                  ? 15
                  : useMidRoundCorner
                      ? 5 //10
                      : 4,
            ),
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
                : needIcon
                    ? [
                        Image.asset(
                          KAssets.errorAsset,
                          color: KColors.primaryColor,
                          height: 22,
                        ),
                        const Sbw(w: 7),
                        Text(
                          buttonName!,
                          style: Kstyles.kAppBarTextStyle.copyWith(
                            fontSize: fontSize,
                            color: useGreen
                                ? KColors.switchColor
                                : useGrey
                                    ? KColors().midGreyColor
                                    : useRed
                                        ? KColors.errorColor
                                        : KColors.primaryColor,
                          ),
                        ),
                      ]
                    : [
                        Text(
                          buttonName!,
                          style: Kstyles.kAppBarTextStyle.copyWith(
                            fontSize: fontSize,
                            color: useGreen
                                ? KColors.switchColor
                                : useGrey
                                    ? KColors().midGreyColor
                                    : useRed
                                        ? KColors.errorColor
                                        : KColors.primaryColor,
                          ),
                        ),
                      ],
          ),
        ),
      ],
    );
  }
}
