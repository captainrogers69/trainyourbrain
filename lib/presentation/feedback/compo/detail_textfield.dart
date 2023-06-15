import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

class DetailTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  final void Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, minLines, maxLines;
  final double? vert, marginzero;
  final TextCapitalization txtCapital;
  final bool enabled, obsecure;
  final AutovalidateMode? onUserInteraction;
  final Widget? suffix, prefix;
  const DetailTextfield({
    super.key,
    this.onChanged,
    this.keyBoardType,
    this.maxLength,
    this.suffix,
    this.enabled = true,
    this.obsecure = false,
    this.maxLines = 1,
    this.vert,
    this.marginzero,
    this.minLines = 1,
    this.validator,
    this.inputFormatters,
    this.txtCapital = TextCapitalization.none,
    required this.labelText,
    this.prefix,
    required this.controller,
    required this.hintText,
    this.onUserInteraction = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: witBoxShadow,
      //   color: whiteColor,
      // ),
      margin: EdgeInsets.symmetric(vertical: marginzero ?? 9, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: vert ?? 1),
      child: TextFormField(
        onChanged: onChanged,
        // scrollPadding: const EdgeInsets.symmetric(vertical: 8),
        textCapitalization: txtCapital,
        maxLines: maxLines,
        minLines: minLines,
        controller: controller,
        validator: validator ??
            (val) {
              return null;
            },
        inputFormatters: keyBoardType == TextInputType.number
            ? [
                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
              ]
            : inputFormatters,
        keyboardType: keyBoardType,
        maxLength: maxLength,
        obscureText: obsecure,
        style: maxLines == 1
            ? Kstyles.kSmallTextStyle
            : Kstyles.kVerySmallTextStyle,
        autovalidateMode: onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: prefix,
          counterText: '',
          suffixIcon: suffix,
          enabled: enabled,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Kstyles.kSmallTextStyle.copyWith(
            fontSize: 13,
          ),
          labelText: labelText,
          labelStyle: Kstyles.kVerySmallTextStyle.copyWith(
            color: KColors().midGreyColor,
            fontSize: 14.5,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: KColors().greyColor,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 10, vertical: maxLines == 1 ? 0 : 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: KColors().greyColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: KColors().greyColor,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red[700]!,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red[700]!,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
