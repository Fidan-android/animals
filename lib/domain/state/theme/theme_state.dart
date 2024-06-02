import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../data/repository/theme_repository.dart';

part 'theme_state.g.dart';

class ThemeState = ThemeStateBase with _$ThemeState;

abstract class ThemeStateBase with Store {
  ThemeStateBase(this._themeRepository);

  final ThemeRepository _themeRepository;

  ThemeData get darkTheme => ThemeData(
        useMaterial3: false,
        canvasColor: Colors.transparent,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        primaryColor: const Color(0xFF1A1A1A),
        primaryTextTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Colors.black,
              fontFamily: 'SFProDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  ThemeData get lightTheme => ThemeData(
    useMaterial3: false,
    canvasColor: Colors.transparent,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xFF1A1A1A),
    primaryTextTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  Future<ThemeData> _getTheme() async {
    final String? themeKey = await _themeRepository.getThemeKey();

    if (themeKey == null) {
      await _themeRepository.setThemeKey(lightTheme.brightness);

      return lightTheme;
    } else {
      return themeKey == "light" ? lightTheme : darkTheme;
    }
  }

  Future<ThemeData> _toggleTheme(ThemeData? theme) async {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }

    await _themeRepository.setThemeKey(theme.brightness);
    return theme;
  }

  @computed
  bool get isDark => theme?.brightness == Brightness.dark;

  @observable
  ThemeData? theme;

  @action
  Future<void> getTheme() async {
    theme = lightTheme;
    theme = await _getTheme();
  }

  @action
  Future<void> toggleTheme() async {
    theme = await _toggleTheme(theme);
  }
}
