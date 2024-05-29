import 'package:animals/presentation/onboarding/onboarding_page.dart';
import 'package:animals/presentation/splash/splash_page.dart';
import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: OnboardingPage),
  ],
)
class $NavigationRouter {}

final appRouter = NavigationRouter();