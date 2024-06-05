// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PremiumState on PremiumStateBase, Store {
  late final _$isSuccessPaidAtom =
      Atom(name: 'PremiumStateBase.isSuccessPaid', context: context);

  @override
  bool? get isSuccessPaid {
    _$isSuccessPaidAtom.reportRead();
    return super.isSuccessPaid;
  }

  @override
  set isSuccessPaid(bool? value) {
    _$isSuccessPaidAtom.reportWrite(value, super.isSuccessPaid, () {
      super.isSuccessPaid = value;
    });
  }

  late final _$PremiumStateBaseActionController =
      ActionController(name: 'PremiumStateBase', context: context);

  @override
  void onGetAccess() {
    final _$actionInfo = _$PremiumStateBaseActionController.startAction(
        name: 'PremiumStateBase.onGetAccess');
    try {
      return super.onGetAccess();
    } finally {
      _$PremiumStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSuccessPaid: ${isSuccessPaid}
    ''';
  }
}
