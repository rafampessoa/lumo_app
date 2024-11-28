import 'package:go_router/go_router.dart';
import 'package:lumo_flutter/src/presentation/create_child_page.dart';
import 'package:lumo_flutter/src/presentation/create_story_page.dart';
import 'package:lumo_flutter/src/presentation/home_page.dart';
import 'package:lumo_flutter/src/presentation/onboarding_page.dart';

final router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/create-child',
      builder: (context, state) => const CreateChildPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/create-story',
      builder: (context, state) => const CreateStoryPage(),
    ),
  ],
);
