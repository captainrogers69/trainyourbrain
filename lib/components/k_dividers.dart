import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:flutter/material.dart';
import '../utils/constants/kstyles.dart';
import '../utils/responsive/size_config.dart';

class KRegularDivider extends StatelessWidget {
  final double? horizontal, thick, vertical;
  final Color? color;
  const KRegularDivider({
    this.horizontal,
    this.thick,
    this.vertical,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 20,
        vertical: vertical ?? 0,
      ),
      child: Divider(
        thickness: thick ?? 1,
        color: color ?? Colors.black,
      ),
    );
  }
}

class KNoSpaceDivider extends StatelessWidget {
  final double? horizontal, thick, vertical;
  final Color? color;
  const KNoSpaceDivider({
    this.horizontal,
    this.thick,
    this.vertical,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontal ?? 20,
        vertical: vertical ?? 0,
      ),
      child: Container(
        height: thick ?? 1,
        color: color ?? KColors().lightGreyColor,
      ),
    );
  }
}

class KVerticallyDivider extends StatelessWidget {
  final double? height, width;
  final Color? color;
  const KVerticallyDivider({
    this.width,
    this.height,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 21,
      width: width ?? 1.4,
      color: color ?? Colors.grey[300],
    );
  }
}

class KAboutDivider extends StatelessWidget {
  final double? horizontal;
  final Color? color;
  const KAboutDivider({
    this.horizontal,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 20),
      child: Divider(
        color: color ?? Colors.black.withOpacity(0.6),
      ),
    );
  }
}

class KOrDivider extends StatelessWidget {
  final String? title;
  const KOrDivider({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1.5)),
        Padding(
          padding: EdgeInsets.all(getSize(10)),
          child: Text(
            title ?? "Or",
            style: Kstyles.kSmallTextStyle,
          ),
        ),
        const Expanded(child: Divider(thickness: 1.5)),
      ],
    );
  }
}
