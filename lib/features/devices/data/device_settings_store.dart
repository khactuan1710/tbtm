import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the default on-duration (minutes) applied when toggling a device.
@lazySingleton
class DeviceSettingsStore {
  DeviceSettingsStore(this._prefs);

  final SharedPreferences _prefs;

  static const _defaultMinutesKey = 'default_minutes';

  int get defaultMinutes => _prefs.getInt(_defaultMinutesKey) ?? 30;

  Future<void> setDefaultMinutes(int minutes) =>
      _prefs.setInt(_defaultMinutesKey, minutes);
}
