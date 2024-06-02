import 'package:animals/data/repository/storage_repository.dart';
import 'package:animals/domain/state/onboarding/onboarding_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingState _onboardingState;
  late List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    _onboardingState =
        OnboardingState(Provider.of<StorageRepository>(context, listen: false));
    _disposers = [
      reaction((_) => _onboardingState.isCloseOnboard, (isCloseOnboard) {
        if (isCloseOnboard) {
          AutoRouter.of(context).replaceNamed("/main-page");
        }
      })
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Observer(
            builder: (_) => Expanded(
              child: [
                _generateView(
                    "assets/images/onboarding/animals.png",
                    "Welcome to the\nStock Market Zoo!",
                    "Explore stock market jargon with our animal-themed guide."
                        " Learn how different animals symbolize trading behaviors and "
                        "market indicators, making complex concepts accessible and engaging."),
                _generateView(
                    "assets/images/onboarding/quiz.png",
                    "Take the Quiz",
                    "Dive into the dynamic world of trading with our"
                        " fun and educational approach. Release animals from the "
                        "zoo by answering little quiz."),
              ][_onboardingState.currentPage],
            ),
          ),
        ],
      ),
    );
  }

  Widget _generateView(String backgroundImage, String title, String body) =>
      Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      body,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(letterSpacing: 0.15),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 28),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: ElevatedButton(
                              onPressed: () => _onboardingState.nextPage(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 44),
                          child: GestureDetector(
                            onTap: () => _onboardingState.skipOnboarding(),
                            child: Text(
                              "Skip",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: const Color(0xFF959595),
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
