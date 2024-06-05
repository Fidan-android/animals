// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizState on QuizStateBase, Store {
  late final _$animalModelAtom =
      Atom(name: 'QuizStateBase.animalModel', context: context);

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

  late final _$isShowFirstResultAtom =
      Atom(name: 'QuizStateBase.isShowFirstResult', context: context);

  @override
  bool get isShowFirstResult {
    _$isShowFirstResultAtom.reportRead();
    return super.isShowFirstResult;
  }

  @override
  set isShowFirstResult(bool value) {
    _$isShowFirstResultAtom.reportWrite(value, super.isShowFirstResult, () {
      super.isShowFirstResult = value;
    });
  }

  late final _$isShowSecondResultAtom =
      Atom(name: 'QuizStateBase.isShowSecondResult', context: context);

  @override
  bool get isShowSecondResult {
    _$isShowSecondResultAtom.reportRead();
    return super.isShowSecondResult;
  }

  @override
  set isShowSecondResult(bool value) {
    _$isShowSecondResultAtom.reportWrite(value, super.isShowSecondResult, () {
      super.isShowSecondResult = value;
    });
  }

  late final _$isShowThirdResultAtom =
      Atom(name: 'QuizStateBase.isShowThirdResult', context: context);

  @override
  bool get isShowThirdResult {
    _$isShowThirdResultAtom.reportRead();
    return super.isShowThirdResult;
  }

  @override
  set isShowThirdResult(bool value) {
    _$isShowThirdResultAtom.reportWrite(value, super.isShowThirdResult, () {
      super.isShowThirdResult = value;
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
  void onCheckAnswer(String answer) {
    final _$actionInfo = _$QuizStateBaseActionController.startAction(
        name: 'QuizStateBase.onCheckAnswer');
    try {
      return super.onCheckAnswer(answer);
    } finally {
      _$QuizStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNextQuestion() {
    final _$actionInfo = _$QuizStateBaseActionController.startAction(
        name: 'QuizStateBase.onNextQuestion');
    try {
      return super.onNextQuestion();
    } finally {
      _$QuizStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTryAgain() {
    final _$actionInfo = _$QuizStateBaseActionController.startAction(
        name: 'QuizStateBase.onTryAgain');
    try {
      return super.onTryAgain();
    } finally {
      _$QuizStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRestartQuiz() {
    final _$actionInfo = _$QuizStateBaseActionController.startAction(
        name: 'QuizStateBase.onRestartQuiz');
    try {
      return super.onRestartQuiz();
    } finally {
      _$QuizStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSaveSolvedResult() {
    final _$actionInfo = _$QuizStateBaseActionController.startAction(
        name: 'QuizStateBase.onSaveSolvedResult');
    try {
      return super.onSaveSolvedResult();
    } finally {
      _$QuizStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animalModel: ${animalModel},
isFirstAnswerCorrect: ${isFirstAnswerCorrect},
isSecondAnswerCorrect: ${isSecondAnswerCorrect},
isThirdAnswerCorrect: ${isThirdAnswerCorrect},
currentIndexOfQuestion: ${currentIndexOfQuestion},
isShowFirstResult: ${isShowFirstResult},
isShowSecondResult: ${isShowSecondResult},
isShowThirdResult: ${isShowThirdResult}
    ''';
  }
}
