import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import 'app_config.dart';

abstract class AppThemes {
  static const double columnWidth = 360.0;
  static bool isColumnMode(BuildContext context) =>
      MediaQuery.of(context).size.width > columnWidth * 2;

  static const fallbackTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontFamilyFallback: ['NotoEmoji'],
  );

  static const TextStyle loginTextFieldStyle = TextStyle(color: Colors.black);

  static InputDecoration loginTextFieldDecoration({
    String? errorText,
    String? labelText,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? errorColor,
  }) => InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConfig.borderRadius),
    ),
    fillColor: Colors.white.withAlpha(200),
    labelText: labelText,
    hintText: hintText,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    suffixIconColor: Colors.black,
    prefixIconColor: Colors.black,
    iconColor: Colors.black,
    errorText: errorText,
    errorMaxLines: 4,
    errorStyle: TextStyle(
      color: errorColor ?? Colors.redAccent.shade200,
      shadows: const [
        Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 10),
      ],
    ),
    hintStyle: TextStyle(color: Colors.grey.shade700),
    labelStyle: const TextStyle(
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5),
      ],
    ),
    contentPadding: const EdgeInsets.all(16),
  );

  static var fallbackTextTheme = const TextTheme(
    bodyLarge: fallbackTextStyle,
    bodyMedium: fallbackTextStyle,
    labelLarge: fallbackTextStyle,
    bodySmall: fallbackTextStyle,
    labelSmall: fallbackTextStyle,
    displayLarge: fallbackTextStyle,
    displayMedium: fallbackTextStyle,
    displaySmall: fallbackTextStyle,
    headlineMedium: fallbackTextStyle,
    headlineSmall: fallbackTextStyle,
    titleLarge: fallbackTextStyle,
    titleMedium: fallbackTextStyle,
    titleSmall: fallbackTextStyle,
  );

  static ThemeData light([ColorScheme? colorScheme]) => ThemeData(
    visualDensity: VisualDensity.standard,
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed:
        AppConfig.colorSchemeSeed ?? colorScheme?.primary ?? Color(0xFF8B88EF),
    scaffoldBackgroundColor: Colors.grey[50],
    primaryTextTheme: Typography.blackCupertino,
    textTheme: TextTheme(
      //displaySmall: TextStyle(color: Colors.black87),
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      labelLarge: TextStyle(color: Colors.black87),
      displayLarge: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black87),
      titleMedium: TextStyle(color: Colors.black54),
      titleSmall: TextStyle(color: Colors.black54),
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    dividerColor: Colors.grey[300],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        elevation: 4,
        shadowColor: const Color(0x44000000),
        minimumSize: const Size.fromHeight(48),
        padding: const EdgeInsets.all(12),
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: 4,
      // shadowColor: Color(0x44000000),
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const UnderlineInputBorder(borderSide: BorderSide(width: 1)),
      filled: true,
      fillColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 6,
      shadowColor: Color(0x44000000),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.redAccent,
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.white54),
    ),
    /*colorScheme: ColorScheme(
      surface: Colors.grey,
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent,
      error: Colors.redAccent,
      brightness: Brightness.light,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
      onError: Colors.white,
    ),*/
  );

  static ThemeData dark([ColorScheme? colorScheme]) => ThemeData(
    visualDensity: VisualDensity.standard,
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed:
        AppConfig.colorSchemeSeed ?? colorScheme?.primary ?? Color(0xFF8B88EF),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      //button: TextStyle(color: color_primary_black),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white54),
    ),
    cardTheme: const CardThemeData(
      elevation: 4,
      // shadowColor: Color(0x44000000),
      clipBehavior: Clip.hardEdge,
      color: Color(0xFF232A2E),
      surfaceTintColor: Color(0xFF232A2E),
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    dividerColor: Colors.blueGrey.shade600,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppConfig.chatColor,
        minimumSize: const Size.fromHeight(48),
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.all(12),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 6,
      //backgroundColor: Color(0xff1D1D1D),
      backgroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.redAccent,
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.white54),
    ),
  );

  static Color blackWhiteColor(BuildContext context, {bool invert = false}) =>
      Theme.of(context).brightness == Brightness.light && !invert
      ? Colors.white
      : Colors.black;

  static Color secondaryBlackWhiteColor(
    BuildContext context, {
    bool invert = false,
  }) => Theme.of(context).brightness == Brightness.light && !invert
      ? Colors.white54
      : textSecondaryColor;

  static Color secondaryTextColor(
    BuildContext context, {
    bool invert = false,
  }) => Theme.of(context).brightness == Brightness.light && !invert
      ? Colors.black54
      : Colors.white54;

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );

    return hslLight.toColor();
  }

  // Bold Text Style
  static TextStyle boldTextStyle({
    int? size,
    FontWeight? weight,
    String? fontFamily,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    TextDecorationStyle? textDecorationStyle,
    TextBaseline? textBaseline,
    Color? decorationColor,
    Color? backgroundColor,
    double? height,
  }) {
    return TextStyle(
      fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
      fontWeight: weight ?? fontWeightBoldGlobal,
      fontFamily: fontFamily ?? fontFamilyBoldGlobal,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationStyle: textDecorationStyle,
      decorationColor: decorationColor,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
      height: height,
    );
  }

  // Primary Text Style
  static TextStyle primaryTextStyle({
    int? size,
    FontWeight? weight,
    String? fontFamily,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    TextDecorationStyle? textDecorationStyle,
    TextBaseline? textBaseline,
    Color? decorationColor,
    Color? backgroundColor,
    double? height,
  }) {
    return TextStyle(
      fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
      fontWeight: weight ?? fontWeightPrimaryGlobal,
      fontFamily: fontFamily ?? fontFamilyPrimaryGlobal,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationStyle: textDecorationStyle,
      decorationColor: decorationColor,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
      height: height,
    );
  }

  // Secondary Text Style
  static TextStyle secondaryTextStyle({
    int? size,
    FontWeight? weight,
    String? fontFamily,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    TextDecorationStyle? textDecorationStyle,
    TextBaseline? textBaseline,
    Color? decorationColor,
    Color? backgroundColor,
    double? height,
    BuildContext? context,
  }) {
    return TextStyle(
      fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
      fontWeight: weight ?? fontWeightSecondaryGlobal,
      fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationStyle: textDecorationStyle,
      decorationColor: decorationColor,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
      height: height,
      color: context != null
          ? (Theme.of(context).brightness == Brightness.dark
                ? Colors.white54
                : textSecondaryColor)
          : null,
    );
  }

  // Create Rich Text
  static RichText createRichText({
    required List<TextSpan> list,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
    TextAlign textAlign = TextAlign.left,
    TextDirection? textDirection,
    StrutStyle? strutStyle,
  }) {
    return RichText(
      text: TextSpan(children: list),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
      strutStyle: strutStyle,
    );
  }
}
