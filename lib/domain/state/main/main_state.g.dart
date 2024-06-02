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
  String toString() {
    return '''
animals: ${animals}
    ''';
  }
}
