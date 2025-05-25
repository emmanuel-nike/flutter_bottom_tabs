import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

abstract class ISettingsRepository {
  Future<ThemeMode> getAppTheme();
  Future<void> setAppTheme(ThemeMode themeMode);
}

class SettingsRepository implements ISettingsRepository {
  @override
  Future<ThemeMode> getAppTheme() async {
    String theme = getStringAsync("app_theme", defaultValue: "system");
    Map data = {
      "system": ThemeMode.system,
      "light": ThemeMode.light,
      "dark": ThemeMode.dark,
    };
    if (data.keys.contains(theme)) {
      return data[theme];
    }
    return ThemeMode.system;
  }

  @override
  Future<void> setAppTheme(ThemeMode themeMode) async {
    await setValue("app_theme", themeMode.name);
  }
}
