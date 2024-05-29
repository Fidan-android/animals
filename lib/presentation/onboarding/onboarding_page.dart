import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/onboarding/animals.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
