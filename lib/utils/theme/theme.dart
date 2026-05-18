import 'package:flutter/material.dart';
import 'package:flutterproject/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutterproject/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutterproject/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutterproject/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutterproject/utils/theme/custom_themes/text_feild_theme.dart';
import 'package:flutterproject/utils/theme/custom_themes/text_theme.dart';
import 'package:flutterproject/utils/theme/custom_themes/elevated_button_theme.dart';

class AAppTheme {
  AAppTheme._(); //PRIVATE CONSTRUCTOR

  // -----------------------------------[Light theme]----------------------------------------------

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AAppBarTheme.lightAppBarTheme,
    checkboxTheme: ACheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: ABottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: AOutlinedButtonTheme.lightOutlinedButtonTheme,
    textTheme: ATextTheme.lightTextTheme,
    elevatedButtonTheme: AElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: ATextFormFeildTheme.lightInputDecorationTheme,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentTextStyle: const TextStyle(color: Colors.white),
      elevation: 6,
    ),
  );

  // -----------------------------------[Dark theme]----------------------------------------------

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 27, 25, 25),
    appBarTheme: AAppBarTheme.darkAppBarTheme,
    checkboxTheme: ACheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: ABottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: AOutlinedButtonTheme.darkOutlinedButtonTheme,
    textTheme: ATextTheme.darkTextTheme,
    elevatedButtonTheme: AElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: ATextFormFeildTheme.darkInputDecorationTheme,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentTextStyle: const TextStyle(color: Colors.white),
      elevation: 6,
    ),
  );
}
