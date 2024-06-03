import 'package:animals/data/repository/animal_repository.dart';
import 'package:animals/domain/state/quiz/quiz_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context).pop(),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Color(0x14000000), blurRadius: 16)
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/images/settings/arrow_left.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Transform.translate(
                                offset: const Offset(0, -60),
                                child: const CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 52,
                                    backgroundImage: AssetImage(
                                        "assets/images/free/bull.png"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "" /*_quizState
                          .questionsOfAnimal[_quizState.currentIndexOfQuestion]
                          .keys
                          .first*/
                          ,
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        //color: const Color(0xFF5AD77D),
                        color: const Color(0xFFE6E6E6),
                      ),
                      shape: BoxShape.circle),
                ),
                Container(
                  width: 18,
                  height: 8,
                  // color: const Color(0xFF5AD77D),
                  color: const Color(0xFFE6E6E6),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        // color: const Color(0xFF5AD77D),
                        color: const Color(0xFFE6E6E6),
                      ),
                      shape: BoxShape.circle),
                ),
                Container(
                  width: 18,
                  height: 8,
                  // color: const Color(0xFF5AD77D),
                  color: const Color(0xFFE6E6E6),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        // color: const Color(0xFF5AD77D),
                        color: const Color(0xFFE6E6E6),
                      ),
                      shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
