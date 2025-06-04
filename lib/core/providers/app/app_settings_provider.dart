import 'package:minimart/core/models/common/app_state/app_state.dart';
import 'package:minimart/core/utils/theme/theme_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_settings_provider.g.dart';

@riverpod
class AppSettings extends _$AppSettings {
  @override
  AppState build() {
    loadAppSettings();
    return AppState.initial();
  }

  Future<void> loadAppSettings() async {
    state = AppState(
      themeMode: ThemeModeExtension.fromString('light'),
    );
  }
}
