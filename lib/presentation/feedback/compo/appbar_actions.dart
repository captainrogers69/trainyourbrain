import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/k_dividers.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../components/k_fetching.dart';
import '../../../utils/constants/button_state.dart';

class AppBarActions extends StatelessWidget {
  final void Function()? create, update, delete, cancel;
  final ButtonState buttonState;
  final bool creatingUpdating;
  final String? createTitle;
  const AppBarActions({
    this.buttonState = ButtonState.idle,
    required this.creatingUpdating,
    this.createTitle = 'Create',
    required this.create,
    required this.update,
    this.delete,
    this.cancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: creatingUpdating,
      replacement: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: delete != null,
            child: TextButton(
              onPressed: delete,
              child: Text(
                "Delete",
                style: Kstyles.kAppBarTextStyle.copyWith(
                  color: KColors.errorColor,
                ),
              ),
            ),
          ),
          Visibility(
            visible: delete != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child:
                  KVerticallyDivider(color: KColors().darkGreyColor, width: 2),
            ),
          ),
          TextButton(
            onPressed: update,
            child: Visibility(
              visible: buttonState == ButtonState.idle,
              replacement: const WitTextFetching(
                color: KColors.primaryColor,
              ),
              child: const Text(
                "Update",
                style: Kstyles.kAppBarTextStyle,
              ),
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: cancel ?? () {},
            child: Text(
              "Cancel",
              style: Kstyles.kAppBarTextStyle.copyWith(
                color: KColors.errorColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: KVerticallyDivider(color: KColors().darkGreyColor, width: 2),
          ),
          TextButton(
            onPressed: create,
            child: Visibility(
              visible: buttonState == ButtonState.idle,
              replacement: const WitTextFetching(
                color: KColors.primaryColor,
              ),
              child: Text(
                createTitle!,
                style: Kstyles.kAppBarTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
