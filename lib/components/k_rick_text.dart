import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class KRichText extends StatelessWidget {
  final String text1, text2;
  final GestureRecognizer? recognizer;
  final TextStyle? style1, style2;
  final Color color1, color2;
  const KRichText({
    super.key,
    this.style1,
    this.style2,
    this.recognizer,
    this.color1 = Colors.red,
    this.color2 = Colors.black,
    this.text1 = 'Note: ',
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: style1 ??
                Kstyles.kSmallTextStyle.copyWith(
                  color: color1,
                  fontFamily: 'BalooChettan2',
                ),
          ),
          TextSpan(
            recognizer: recognizer,
            text: text2,
            style: style2 ??
                Kstyles.kSmallTextStyle.copyWith(
                  color: color2,
                  fontFamily: 'BalooChettan2',
                ),
          ),
        ],
      ),
    );
  }
}
