import 'package:trainyourbrain/components/sizing_box.dart';
import 'package:flutter/material.dart';
import '../utils/constants/kstyles.dart';
import '../utils/responsive/size_config.dart';

class KEmpty extends StatelessWidget {
  final String? warningText;
  final bool? showRich;
  const KEmpty({
    super.key,
    this.showRich = false,
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 85),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   Assets.emptyWidget,
          //   width: size.width / 1.3,
          //   height: size.width / 1.5,
          // ),
          const Sbh(h: 20),
          Text(
            warningText ?? 'No results found',
            style: Kstyles.kSmallTextStyle,
          ),

          Visibility(
            visible: showRich!,
            child: TextButton(
              onPressed: () {
                // Navigation.instance.navigateTo(Routes.centreSuggScreen);
              },
              child: Text(
                "Help us",
                style: Kstyles.kSmallTextStyle.copyWith(
                    // color: colorScheme.error,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
