import 'package:animals/presentation/animal/animal_page.dart';
import 'package:animals/presentation/main/main_page.dart';
import 'package:animals/presentation/onboarding/onboarding_page.dart';
import 'package:animals/presentation/premium/premium_page.dart';
import 'package:animals/presentation/quiz/quiz_page.dart';
import 'package:animals/presentation/settings/settings_page.dart';
import 'package:animals/presentation/splash/splash_page.dart';
import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: OnboardingPage),
    AutoRoute(page: MainPage),
    AutoRoute(page: AnimalPage),
    AutoRoute(page: QuizPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: PremiumPage),
  ],
)
class $NavigationRouter {}

final appRouter = NavigationRouter();
