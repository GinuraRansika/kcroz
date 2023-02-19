import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcroz/src/utils/theme/widget_themes/text_theme.dart';

class KcrozAppTheme {
  KcrozAppTheme._(); // user shouldn't access theme using an instance of the class

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: KcrozTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: KcrozTextTheme.darkTextTheme,
  );
}
