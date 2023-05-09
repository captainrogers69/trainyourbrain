import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/responsive/size_config.dart';

class KError extends StatelessWidget {
  final String? warningText;
  final bool? closed;
  const KError({
    super.key,
    this.closed = false,
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            closed! ? KAssets.closedWidget : KAssets.errorWidget,
            width: size.width / 1.3,
            height: size.width / 1.5,
          ),
          Text(
            warningText ?? '404! An Error Occured',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: getFontSize(16),
            ),
          ),
        ],
      ),
    );
  }
}
