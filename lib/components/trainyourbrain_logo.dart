import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

class TrainYourBrainLogo extends StatelessWidget {
  final double logoSize;
  const TrainYourBrainLogo({this.logoSize = 23, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Train',
                style: Kstyles.kHeadingTextStyle.copyWith(
                  fontSize: logoSize,
                  fontFamily: 'EuclidBold',
                  color: KColors.whiteColor,
                ),
              ),
              TextSpan(
                text: 'Your',
                style: Kstyles.kHeadingTextStyle.copyWith(
                  fontSize: logoSize,
                  fontFamily: 'EuclidBold',
                  color: KColors.whiteColor,
                ),
              ),
              TextSpan(
                text: 'Brain',
                style: Kstyles.kHeadingTextStyle.copyWith(
                  fontSize: logoSize,
                  fontFamily: 'EuclidBold',
                  color: KColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
