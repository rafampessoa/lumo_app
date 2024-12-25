import 'package:go_router/go_router.dart';
import 'package:lumo_flutter/src/presentation/create_child_page.dart';
import 'package:lumo_flutter/src/presentation/story/create_story_page.dart';
import 'package:lumo_flutter/src/presentation/home_page.dart';
import 'package:lumo_flutter/src/presentation/onboarding_page.dart';

import 'presentation/story/create_own_story_objective_page.dart';
import 'presentation/story/record_objective_page.dart';
import 'presentation/story/strengthen_family_bond_page.dart';

final router = GoRouter(
  initialLocation: '/create-story',
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
      builder: (context, state) => CreateStoryPage(),
      routes: [
        GoRoute(
          path: '/objective',
          builder: (context, state) => const CreateOwnStoryObjectivePage(),
          routes: [
            GoRoute(
              path: '/strengthen-family-bond',
              builder: (context, state) => const StrengthenFamilyBondPage(),
            ),
            GoRoute(
              path: '/record',
              builder: (context, state) => const RecordObjectivePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
