import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import '../../utils/constants/kstyles.dart';

class AppTheme {
  AppTheme._();
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: KColors.whiteColor,
    //  const Color(0xffeeefee),
    // primaryColor: primaryColor,
    cardColor: Colors.white,
    fontFamily: 'BalooChettan2', // 'Poppins',
    appBarTheme: AppBarTheme(
      // backgroundColor: primaryColor,
      titleTextStyle: Kstyles.kAppBarTextStyle.copyWith(
          // color: darkGreyColor,
          ),
      // color: whiteColor,
      iconTheme: const IconThemeData(
          // color: whiteColor,
          ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        // buttonColor: whiteColor,
        ),
    // colorScheme: ColorScheme(
    //   background: Colors.black,
    // ),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xff04b4f3),
    cardColor: Colors.white,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xFF0f101c),
    appBarTheme: const AppBarTheme(
      // color: whiteColor,
      iconTheme: IconThemeData(
          // color: whiteColor,
          ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xffffffff),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    // colorScheme: ColorScheme(background: Colors.white),
  );
}
