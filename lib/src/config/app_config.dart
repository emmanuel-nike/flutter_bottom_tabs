import 'dart:ui';

abstract class AppConfig {
  static final String _applicationName = 'Flutter Bottom Tabs';
  static String get applicationName => _applicationName;
  static String? _applicationWelcomeMessage;
  static String? get applicationWelcomeMessage => _applicationWelcomeMessage;
  static double bubbleSizeFactor = 1;
  static double fontSizeFactor = 1;
  static const Color chatColor = primaryColor;
  static Color? colorSchemeSeed = primaryColor;
  static const double messageFontSize = 15.75;
  static const bool allowOtherHomeservers = true;
  static const bool enableRegistration = true;
  static const Color primaryColor = Color(0xFF241C34);
  static const Color primaryColorLight = Color(0xFFCCBDEA);
  static const Color secondaryColor = Color(0xFF41a2bc);
  static bool renderHtml = true;
  static bool hideRedactedEvents = true;
  static bool hideUnknownEvents = true;
  static bool showDirectChatsInSpaces = true;
  static bool separateChatTypes = false;
  static bool autoplayImages = true;
  static bool sendOnEnter = false;
  static bool experimentalVoip = false;
  static const bool hideTypingUsernames = false;
  static const bool hideAllStateEvents = false;
  static const String emojiFontName = 'Noto Emoji';
  static const String emojiFontUrl =
      'https://github.com/googlefonts/noto-emoji/';
  static const double borderRadius = 16.0;
  static const double columnWidth = 360.0;
}
