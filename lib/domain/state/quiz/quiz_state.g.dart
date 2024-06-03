// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizState on QuizStateBase, Store {
  late final _$isFirstAnswerCorrectAtom =
      Atom(name: 'QuizStateBase.isFirstAnswerCorrect', context: context);

  @override
  bool? get isFirstAnswerCorrect {
    _$isFirstAnswerCorrectAtom.reportRead();
    return super.isFirstAnswerCorrect;
  }

  @override
  set isFirstAnswerCorrect(bool? value) {
    _$isFirstAnswerCorrectAtom.reportWrite(value, super.isFirstAnswerCorrect,
        () {
      super.isFirstAnswerCorrect = value;
    });
  }

  late final _$isSecondAnswerCorrectAtom =
      Atom(name: 'QuizStateBase.isSecondAnswerCorrect', context: context);

  @override
  bool? get isSecondAnswerCorrect {
    _$isSecondAnswerCorrectAtom.reportRead();
    return super.isSecondAnswerCorrect;
  }

  @override
  set isSecondAnswerCorrect(bool? value) {
    _$isSecondAnswerCorrectAtom.reportWrite(value, super.isSecondAnswerCorrect,
        () {
      super.isSecondAnswerCorrect = value;
    });
  }

  late final _$isThirdAnswerCorrectAtom =
      Atom(name: 'QuizStateBase.isThirdAnswerCorrect', context: context);

  @override
  bool? get isThirdAnswerCorrect {
    _$isThirdAnswerCorrectAtom.reportRead();
    return super.isThirdAnswerCorrect;
  }

  @override
  set isThirdAnswerCorrect(bool? value) {
    _$isThirdAnswerCorrectAtom.reportWrite(value, super.isThirdAnswerCorrect,
        () {
      super.isThirdAnswerCorrect = value;
    });
  }

  late final _$currentIndexOfQuestionAtom =
      Atom(name: 'QuizStateBase.currentIndexOfQuestion', context: context);

  @override
  int get currentIndexOfQuestion {
    _$currentIndexOfQuestionAtom.reportRead();
    return super.currentIndexOfQuestion;
  }

  @override
  set currentIndexOfQuestion(int value) {
    _$currentIndexOfQuestionAtom
        .reportWrite(value, super.currentIndexOfQuestion, () {
      super.currentIndexOfQuestion = value;
    });
  }

  late final _$QuizStateBaseActionController =
      ActionController(name: 'QuizStateBase', context: context);

  @override
  void onConfigureQuiz(int index) {
    final _$actionInfo = _$QuizStateBaseActionController.startAction(
        name: 'QuizStateBase.onConfigureQuiz');
    try {
      return super.onConfigureQuiz(index);
    } finally {
      _$QuizStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstAnswerCorrect: ${isFirstAnswerCorrect},
isSecondAnswerCorrect: ${isSecondAnswerCorrect},
isThirdAnswerCorrect: ${isThirdAnswerCorrect},
currentIndexOfQuestion: ${currentIndexOfQuestion}
    ''';
  }
}
