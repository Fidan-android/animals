// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingState on OnboardingStateBase, Store {
  late final _$isCloseOnboardAtom =
      Atom(name: 'OnboardingStateBase.isCloseOnboard', context: context);

  @override
  bool get isCloseOnboard {
    _$isCloseOnboardAtom.reportRead();
    return super.isCloseOnboard;
  }

  @override
  set isCloseOnboard(bool value) {
    _$isCloseOnboardAtom.reportWrite(value, super.isCloseOnboard, () {
      super.isCloseOnboard = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'OnboardingStateBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$nextPageAsyncAction =
      AsyncAction('OnboardingStateBase.nextPage', context: context);

  @override
  Future<dynamic> nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  late final _$skipOnboardingAsyncAction =
      AsyncAction('OnboardingStateBase.skipOnboarding', context: context);

  @override
  Future<dynamic> skipOnboarding() {
    return _$skipOnboardingAsyncAction.run(() => super.skipOnboarding());
  }

  @override
  String toString() {
    return '''
isCloseOnboard: ${isCloseOnboard},
currentPage: ${currentPage}
    ''';
  }
}
