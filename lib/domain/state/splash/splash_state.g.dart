// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashState on SplashStateBase, Store {
  late final _$isFirstLaunchAtom =
      Atom(name: 'SplashStateBase.isFirstLaunch', context: context);

  @override
  bool get isFirstLaunch {
    _$isFirstLaunchAtom.reportRead();
    return super.isFirstLaunch;
  }

  @override
  set isFirstLaunch(bool value) {
    _$isFirstLaunchAtom.reportWrite(value, super.isFirstLaunch, () {
      super.isFirstLaunch = value;
    });
  }

  late final _$SplashStateBaseActionController =
      ActionController(name: 'SplashStateBase', context: context);

  @override
  void checkFirstLaunch() {
    final _$actionInfo = _$SplashStateBaseActionController.startAction(
        name: 'SplashStateBase.checkFirstLaunch');
    try {
      return super.checkFirstLaunch();
    } finally {
      _$SplashStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstLaunch: ${isFirstLaunch}
    ''';
  }
}
