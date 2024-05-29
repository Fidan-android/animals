import 'package:animals/conventions/enum/shared_keys.dart';
import 'package:animals/domain/repository/i_theme_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository extends IThemeRepository {
  @override
  Future<String?> getThemeKey() async {
    return (await SharedPreferences.getInstance())
        .getString(SharedKeys.appTheme.key);
  }

  @override
  Future<void> setThemeKey(Brightness brightness) async {
    (await SharedPreferences.getInstance()).setString(SharedKeys.appTheme.key,
        brightness == Brightness.light ? "light" : "dark");
  }
}
