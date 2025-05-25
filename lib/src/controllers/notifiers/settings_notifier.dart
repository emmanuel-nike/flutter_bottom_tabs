import 'package:flutter/material.dart';
import 'package:flutter_bottom_tabs/src/controllers/repositories/settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingState {
  final ThemeMode themeMode;
  final String? errorMessage;
  const SettingState({this.themeMode = ThemeMode.system, this.errorMessage});

  SettingState copyWith({ThemeMode? themeMode, String? errorMessage}) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SettingState &&
        o.themeMode == themeMode &&
        o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => themeMode.hashCode + errorMessage.hashCode;
}

class SettingsNotifier extends StateNotifier<SettingState> {
  final ISettingsRepository _settingsRepository;

  SettingsNotifier(this._settingsRepository) : super(SettingState());

  void resetStatus() {
    state = SettingState();
  }

  void initSettings() {
    getAppTheme();
  }

  Future<void> getAppTheme() async {
    ThemeMode themeMode = await _settingsRepository.getAppTheme();
    state = state.copyWith(themeMode: themeMode);
  }

  Future<void> setAppTheme(ThemeMode themeMode) async {
    await _settingsRepository.setAppTheme(themeMode);
    state = state.copyWith(themeMode: themeMode);
  }
}
