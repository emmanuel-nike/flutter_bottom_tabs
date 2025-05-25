import 'package:flutter_bottom_tabs/src/controllers/notifiers/settings_notifier.dart';
import 'package:flutter_bottom_tabs/src/controllers/repositories/settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsRepositoryProvider = Provider<ISettingsRepository>(
  (ref) => SettingsRepository(),
);

final settingsNotifierProvider =
    StateNotifierProvider<SettingsNotifier, SettingState>(
      (ref) =>
          SettingsNotifier(ref.watch(settingsRepositoryProvider))
            ..initSettings(),
    );
