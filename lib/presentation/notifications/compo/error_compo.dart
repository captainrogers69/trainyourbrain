import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_assets.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../utils/responsive/size_config.dart';

class ErrorCompo extends StatelessWidget {
  final String? warningText, asset;
  const ErrorCompo({
    this.warningText,
    this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset ?? KAssets.errorWidget,
            width: size.width / 1.2,
            height: size.width / 1.2,
          ),
          Text(
            warningText ?? '404! An Error Occured',
            style: Kstyles.kAppBarTextStyle,
          ),
        ],
      ),
    );
  }
}
