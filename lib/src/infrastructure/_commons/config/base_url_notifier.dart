import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A simple global base URL holder with notification on change.
///
/// If a [SharedPreferences] instance is provided, the value is persisted under
/// the key [BaseUrlNotifier.storageKey].
///
/// Example:
/// ```dart
/// final baseUrl = sl<BaseUrlNotifier>().baseUrl;
/// sl<BaseUrlNotifier>().baseUrl = 'https://api.example.com';
/// sl<BaseUrlNotifier>().addListener(() { /* react to change */ });
/// ```

class BaseUrlNotifier extends ChangeNotifier {
  static const String storageKey = 'core.base_url';

  final SharedPreferences? _prefs;
  String? _baseUrl;

  BaseUrlNotifier({String? initial, SharedPreferences? prefs})
    : _prefs = prefs,
      _baseUrl = initial?.trim();

  /// Current base URL (nullable until set). Always returned trimmed.
  String? get baseUrl => _baseUrl;

  /// True if a non-empty base URL has been set.
  bool get hasValue => _baseUrl != null && _baseUrl!.isNotEmpty;

  /// Set (or clear with null/empty) the base URL. Trims value and notifies only
  /// if it actually changed.
  set baseUrl(String? value) {
    final normalized = value?.trim();
    if (normalized == _baseUrl) return; // no change
    _baseUrl = normalized?.isEmpty == true ? null : normalized;
    if (_prefs != null) {
      if (_baseUrl == null) {
        _prefs.remove(storageKey);
      } else {
        _prefs.setString(storageKey, _baseUrl!);
      }
    }
    notifyListeners();
  }

  /// Update only if predicate passes, returning true when updated.
  bool updateIf(String? value, {bool Function(String? current)? when}) {
    if (when != null && !when(_baseUrl)) return false;
    baseUrl = value; // will handle change/no-change logic
    return true;
  }

  /// Clears the stored base URL (and removes persisted value if any).
  void clear() => baseUrl = null;

  /// Construct directly from SharedPreferences (loads stored value if any)
  factory BaseUrlNotifier.fromPrefs(SharedPreferences prefs) {
    final stored = prefs.getString(storageKey);
    return BaseUrlNotifier(initial: stored, prefs: prefs);
  }

  @override
  String toString() => 'BaseUrlNotifier(baseUrl: $_baseUrl)';
}
