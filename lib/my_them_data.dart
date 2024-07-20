import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class MyThemData {
  ///light mode , dark mode , colors
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: AppColors.blackColor),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        bodyMedium: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 25),
        bodySmall: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ));

  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryDarkMode,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.yellowColor),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: AppColors.primaryDarkMode),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        bodyMedium: TextStyle(
            color: AppColors.yellowColor,
            fontWeight: FontWeight.w700,
            fontSize: 25),
        bodySmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ));
}
