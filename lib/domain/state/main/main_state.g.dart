// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainState on MainStateBase, Store {
  late final _$animalsAtom =
      Atom(name: 'MainStateBase.animals', context: context);

  @override
  ObservableList<AnimalModel> get animals {
    _$animalsAtom.reportRead();
    return super.animals;
  }

  @override
  set animals(ObservableList<AnimalModel> value) {
    _$animalsAtom.reportWrite(value, super.animals, () {
      super.animals = value;
    });
  }

  late final _$isPaidPremiumAtom =
      Atom(name: 'MainStateBase.isPaidPremium', context: context);

  @override
  bool get isPaidPremium {
    _$isPaidPremiumAtom.reportRead();
    return super.isPaidPremium;
  }

  @override
  set isPaidPremium(bool value) {
    _$isPaidPremiumAtom.reportWrite(value, super.isPaidPremium, () {
      super.isPaidPremium = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: 'MainStateBase.currentIndex', context: context);

  @override
  int? get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int? value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$animalModelAtom =
      Atom(name: 'MainStateBase.animalModel', context: context);

  @override
  AnimalModel? get animalModel {
    _$animalModelAtom.reportRead();
    return super.animalModel;
  }

  @override
  set animalModel(AnimalModel? value) {
    _$animalModelAtom.reportWrite(value, super.animalModel, () {
      super.animalModel = value;
    });
  }

  late final _$MainStateBaseActionController =
      ActionController(name: 'MainStateBase', context: context);

  @override
  void onLoadAnimals() {
    final _$actionInfo = _$MainStateBaseActionController.startAction(
        name: 'MainStateBase.onLoadAnimals');
    try {
      return super.onLoadAnimals();
    } finally {
      _$MainStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSelectCurrentModel(int index) {
    final _$actionInfo = _$MainStateBaseActionController.startAction(
        name: 'MainStateBase.onSelectCurrentModel');
    try {
      return super.onSelectCurrentModel(index);
    } finally {
      _$MainStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animals: ${animals},
isPaidPremium: ${isPaidPremium},
currentIndex: ${currentIndex},
animalModel: ${animalModel}
    ''';
  }
}
