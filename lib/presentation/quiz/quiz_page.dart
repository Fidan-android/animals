import 'package:animals/data/repository/animal_repository.dart';
import 'package:animals/domain/state/quiz/quiz_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizState _quizState;

  @override
  void initState() {
    _quizState =
        QuizState(Provider.of<AnimalRepository>(context, listen: false));
    _quizState.onConfigureQuiz(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => Container(
            decoration: BoxDecoration(
              gradient: _generateGradientByResult(),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: GestureDetector(
                          onTap: () => AutoRouter.of(context).pop(),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x14000000), blurRadius: 16)
                              ],
                            ),
                            child: SvgPicture.asset(
                              "assets/images/settings/arrow_left.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => Text(
                          _quizState.animalModel?.name ?? "",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x14000000), blurRadius: 16)
                            ]),
                        child: Wrap(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Transform.translate(
                                    offset: const Offset(0, -40),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.white,
                                      child: Observer(
                                        builder: (_) => CircleAvatar(
                                          radius: 52,
                                          backgroundImage: AssetImage(
                                              "assets/images/${_quizState.animalModel?.image}"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Observer(
                              builder: (_) {
                                if (_quizState.isShowFirstResult ||
                                    _quizState.isShowSecondResult ||
                                    _quizState.isShowThirdResult) {
                                  if (_quizState.currentIndexOfQuestion == 0) {
                                    if (_quizState.isFirstAnswerCorrect !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Transform.translate(
                                              offset: const Offset(0, -25),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Text(
                                                  _quizState.isFirstAnswerCorrect ==
                                                          true
                                                      ? "Correct"
                                                      : "Wrong",
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontSize: 28,
                                                        color: _quizState
                                                                    .isFirstAnswerCorrect ==
                                                                true
                                                            ? const Color(
                                                                0xFF5AD77D)
                                                            : const Color(
                                                                0xFFE83737),
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                  }
                                  if (_quizState.currentIndexOfQuestion == 1) {
                                    if (_quizState.isSecondAnswerCorrect !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Transform.translate(
                                              offset: const Offset(0, -25),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Text(
                                                  _quizState.isSecondAnswerCorrect ==
                                                          true
                                                      ? "Correct"
                                                      : "Wrong",
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontSize: 28,
                                                        color: _quizState
                                                                    .isSecondAnswerCorrect ==
                                                                true
                                                            ? const Color(
                                                                0xFF5AD77D)
                                                            : const Color(
                                                                0xFFE83737),
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                  }
                                  if (_quizState.currentIndexOfQuestion == 2) {
                                    if (_quizState.isThirdAnswerCorrect !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Transform.translate(
                                              offset: const Offset(0, -25),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Text(
                                                  _quizState
                                                                  .isFirstAnswerCorrect ==
                                                              true &&
                                                          _quizState
                                                                  .isSecondAnswerCorrect ==
                                                              true &&
                                                          _quizState
                                                                  .isThirdAnswerCorrect ==
                                                              true
                                                      ? "Quiz Solved"
                                                      : _quizState
                                                                      .isFirstAnswerCorrect ==
                                                                  false &&
                                                              _quizState
                                                                      .isSecondAnswerCorrect ==
                                                                  false &&
                                                              _quizState
                                                                      .isThirdAnswerCorrect ==
                                                                  false
                                                          ? "Quiz Unsolved"
                                                          : "${[
                                                              _quizState
                                                                      .isFirstAnswerCorrect ==
                                                                  false,
                                                              _quizState
                                                                      .isSecondAnswerCorrect ==
                                                                  false,
                                                              _quizState
                                                                      .isThirdAnswerCorrect ==
                                                                  false
                                                            ].where((e) => e).length} Questions Left",
                                                  style:
                                                      Theme.of(context)
                                                          .primaryTextTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            fontSize: 28,
                                                            color: _quizState.isFirstAnswerCorrect == true &&
                                                                    _quizState
                                                                            .isSecondAnswerCorrect ==
                                                                        true &&
                                                                    _quizState
                                                                            .isThirdAnswerCorrect ==
                                                                        true
                                                                ? const Color(
                                                                    0xFF5AD77D)
                                                                : const Color(
                                                                    0xFFE83737),
                                                          ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                  }
                                }
                                return Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Transform.translate(
                                        offset: const Offset(0, -25),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text(
                                            _quizState
                                                .questionsOfAnimal[_quizState
                                                    .currentIndexOfQuestion]
                                                .keys
                                                .first,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium
                                                ?.copyWith(fontSize: 28),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            Observer(
                              builder: (_) {
                                if (_quizState.isShowFirstResult) {
                                  if (_quizState.isFirstAnswerCorrect == true) {
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Transform.translate(
                                            offset: const Offset(0, 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () =>
                                                              _quizState
                                                                  .onNextQuestion(),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF5AD77D),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Next Question",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Transform.translate(
                                            offset: const Offset(0, 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () =>
                                                              _quizState
                                                                  .onTryAgain(),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFE65353),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Try Again",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () =>
                                                              _quizState
                                                                  .onNextQuestion(),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF1A1A1A),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Skip",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                }
                                if (_quizState.isShowSecondResult) {
                                  if (_quizState.isSecondAnswerCorrect ==
                                      true) {
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Transform.translate(
                                            offset: const Offset(0, 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () =>
                                                              _quizState
                                                                  .onNextQuestion(),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF5AD77D),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Next Question",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Transform.translate(
                                            offset: const Offset(0, 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () =>
                                                              _quizState
                                                                  .onTryAgain(),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFE65353),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Try Again",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () =>
                                                              _quizState
                                                                  .onNextQuestion(),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF1A1A1A),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Skip",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                }
                                if (_quizState.isShowThirdResult) {
                                  if (_quizState.isFirstAnswerCorrect == true &&
                                      _quizState.isSecondAnswerCorrect ==
                                          true &&
                                      _quizState.isThirdAnswerCorrect == true) {
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Transform.translate(
                                            offset: const Offset(0, 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: SizedBox(
                                                        height: 48,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            _quizState
                                                                .onSaveSolvedResult();
                                                            AutoRouter.of(
                                                                    context)
                                                                .pop(_quizState.animalModel);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF5AD77D),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          64),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Back to Quizes",
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Stack(children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Transform.translate(
                                          offset: const Offset(0, 70),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 48,
                                                    child: ElevatedButton(
                                                      onPressed: () =>
                                                          _quizState
                                                              .onRestartQuiz(),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFE65353),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(64),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Try Again",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, top: 8),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 48,
                                                    child: ElevatedButton(
                                                      onPressed: () =>
                                                          AutoRouter.of(context)
                                                              .pop(),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFF1A1A1A),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(64),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Back to Quizzes",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ]);
                                  }
                                }

                                return Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Transform.translate(
                                        offset: const Offset(0, 20),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4),
                                                  child: SizedBox(
                                                    height: 48,
                                                    child: ElevatedButton(
                                                      onPressed: () =>
                                                          _quizState
                                                              .onCheckAnswer(
                                                                  "yes"),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFF5AD77D),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(64),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Yes",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4),
                                                  child: SizedBox(
                                                    height: 48,
                                                    child: ElevatedButton(
                                                      onPressed: () =>
                                                          _quizState
                                                              .onCheckAnswer(
                                                                  "no"),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFE65353),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(64),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "No",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: _quizState.isFirstAnswerCorrect == true
                                ? const Color(0xFF5AD77D)
                                : _quizState.isFirstAnswerCorrect == false
                                    ? const Color(0xFFE65353)
                                    : Colors.transparent,
                            border: Border.all(
                              width: 4,
                              //color: const Color(0xFF5AD77D),
                              color: _quizState.isFirstAnswerCorrect == true
                                  ? const Color(0xFF5AD77D)
                                  : _quizState.isFirstAnswerCorrect == false
                                      ? const Color(0xFFE65353)
                                      : const Color(0xFFE6E6E6),
                            ),
                            shape: BoxShape.circle),
                        child: _quizState.isFirstAnswerCorrect == true
                            ? SvgPicture.asset(
                                "assets/images/quiz/correct.svg",
                                fit: BoxFit.scaleDown,
                              )
                            : _quizState.isFirstAnswerCorrect == false
                                ? SvgPicture.asset(
                                    "assets/images/quiz/wrong.svg",
                                    fit: BoxFit.scaleDown,
                                  )
                                : null,
                      ),
                      Container(
                        width: 18,
                        height: 8,
                        // color: const Color(0xFF5AD77D),
                        color: _quizState.isFirstAnswerCorrect == true
                            ? const Color(0xFF5AD77D)
                            : _quizState.isFirstAnswerCorrect == false
                                ? const Color(0xFFE65353)
                                : const Color(0xFFE6E6E6),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: _quizState.isSecondAnswerCorrect == true
                                ? const Color(0xFF5AD77D)
                                : _quizState.isSecondAnswerCorrect == false
                                    ? const Color(0xFFE65353)
                                    : Colors.transparent,
                            border: Border.all(
                              width: 4,
                              // color: const Color(0xFF5AD77D),
                              color: _quizState.isSecondAnswerCorrect == true
                                  ? const Color(0xFF5AD77D)
                                  : _quizState.isSecondAnswerCorrect == false
                                      ? const Color(0xFFE65353)
                                      : const Color(0xFFE6E6E6),
                            ),
                            shape: BoxShape.circle),
                        child: _quizState.isSecondAnswerCorrect == true
                            ? SvgPicture.asset(
                                "assets/images/quiz/correct.svg",
                                fit: BoxFit.scaleDown,
                              )
                            : _quizState.isSecondAnswerCorrect == false
                                ? SvgPicture.asset(
                                    "assets/images/quiz/wrong.svg",
                                    fit: BoxFit.scaleDown,
                                  )
                                : null,
                      ),
                      Container(
                        width: 18,
                        height: 8,
                        // color: const Color(0xFF5AD77D),
                        color: _quizState.isSecondAnswerCorrect == true
                            ? const Color(0xFF5AD77D)
                            : _quizState.isSecondAnswerCorrect == false
                                ? const Color(0xFFE65353)
                                : const Color(0xFFE6E6E6),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: _quizState.isThirdAnswerCorrect == true
                                ? const Color(0xFF5AD77D)
                                : _quizState.isThirdAnswerCorrect == false
                                    ? const Color(0xFFE65353)
                                    : Colors.transparent,
                            border: Border.all(
                              width: 4,
                              // color: const Color(0xFF5AD77D),
                              color: _quizState.isThirdAnswerCorrect == true
                                  ? const Color(0xFF5AD77D)
                                  : _quizState.isThirdAnswerCorrect == false
                                      ? const Color(0xFFE65353)
                                      : const Color(0xFFE6E6E6),
                            ),
                            shape: BoxShape.circle),
                        child: _quizState.isThirdAnswerCorrect == true
                            ? SvgPicture.asset(
                                "assets/images/quiz/correct.svg",
                                fit: BoxFit.scaleDown,
                              )
                            : _quizState.isThirdAnswerCorrect == false
                                ? SvgPicture.asset(
                                    "assets/images/quiz/wrong.svg",
                                    fit: BoxFit.scaleDown,
                                  )
                                : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RadialGradient? _generateGradientByResult() {
    if (_quizState.currentIndexOfQuestion == 0) {
      if (_quizState.isShowFirstResult) {
        return RadialGradient(
          radius: 0.7,
          colors: [
            _quizState.isFirstAnswerCorrect == true
                ? const Color(0x805AD77D)
                : _quizState.isFirstAnswerCorrect == false
                    ? const Color(0x80E65353)
                    : const Color(0x80FFFFFF),
            const Color(0x80FFFFFF),
          ],
        );
      } else {
        return null;
      }
    }

    if (_quizState.currentIndexOfQuestion == 1) {
      if (_quizState.isShowSecondResult) {
        return RadialGradient(
          radius: 0.7,
          colors: [
            _quizState.isSecondAnswerCorrect == true
                ? const Color(0x805AD77D)
                : _quizState.isSecondAnswerCorrect == false
                    ? const Color(0x80E65353)
                    : const Color(0x80FFFFFF),
            const Color(0x80FFFFFF),
          ],
        );
      } else {
        return null;
      }
    }

    if (_quizState.currentIndexOfQuestion == 2) {
      if (_quizState.isShowThirdResult) {
        return RadialGradient(
          radius: 0.7,
          colors: [
            _quizState.isThirdAnswerCorrect == true
                ? const Color(0x805AD77D)
                : _quizState.isThirdAnswerCorrect == false
                    ? const Color(0x80E65353)
                    : const Color(0x80FFFFFF),
            const Color(0x80FFFFFF),
          ],
        );
      } else {
        return null;
      }
    }

    return null;
  }
}
