// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../data/hive/models/animal/animal_model.dart' as _i10;
import '../../presentation/animal/animal_page.dart' as _i4;
import '../../presentation/main/main_page.dart' as _i3;
import '../../presentation/onboarding/onboarding_page.dart' as _i2;
import '../../presentation/premium/premium_page.dart' as _i7;
import '../../presentation/quiz/quiz_page.dart' as _i5;
import '../../presentation/settings/settings_page.dart' as _i6;
import '../../presentation/splash/splash_page.dart' as _i1;

class NavigationRouter extends _i8.RootStackRouter {
  NavigationRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    AnimalRoute.name: (routeData) {
      final args = routeData.argsAs<AnimalRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AnimalPage(
          key: args.key,
          index: args.index,
          animalModel: args.animalModel,
        ),
      );
    },
    QuizRoute.name: (routeData) {
      final args = routeData.argsAs<QuizRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.QuizPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsPage(),
      );
    },
    PremiumRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.PremiumPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-page',
        ),
        _i8.RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        _i8.RouteConfig(
          AnimalRoute.name,
          path: '/animal-page',
        ),
        _i8.RouteConfig(
          QuizRoute.name,
          path: '/quiz-page',
        ),
        _i8.RouteConfig(
          SettingsRoute.name,
          path: '/settings-page',
        ),
        _i8.RouteConfig(
          PremiumRoute.name,
          path: '/premium-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-page',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.AnimalPage]
class AnimalRoute extends _i8.PageRouteInfo<AnimalRouteArgs> {
  AnimalRoute({
    _i9.Key? key,
    required int index,
    required _i10.AnimalModel animalModel,
  }) : super(
          AnimalRoute.name,
          path: '/animal-page',
          args: AnimalRouteArgs(
            key: key,
            index: index,
            animalModel: animalModel,
          ),
        );

  static const String name = 'AnimalRoute';
}

class AnimalRouteArgs {
  const AnimalRouteArgs({
    this.key,
    required this.index,
    required this.animalModel,
  });

  final _i9.Key? key;

  final int index;

  final _i10.AnimalModel animalModel;

  @override
  String toString() {
    return 'AnimalRouteArgs{key: $key, index: $index, animalModel: $animalModel}';
  }
}

/// generated route for
/// [_i5.QuizPage]
class QuizRoute extends _i8.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i9.Key? key,
    required int index,
  }) : super(
          QuizRoute.name,
          path: '/quiz-page',
          args: QuizRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'QuizRoute';
}

class QuizRouteArgs {
  const QuizRouteArgs({
    this.key,
    required this.index,
  });

  final _i9.Key? key;

  final int index;

  @override
  String toString() {
    return 'QuizRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i7.PremiumPage]
class PremiumRoute extends _i8.PageRouteInfo<void> {
  const PremiumRoute()
      : super(
          PremiumRoute.name,
          path: '/premium-page',
        );

  static const String name = 'PremiumRoute';
}
