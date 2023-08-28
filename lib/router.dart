import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/main_navigation_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      routes: [
        GoRoute(
          path: "/:tab(home|discover|write|heart|profile)",
          builder: (context, state) {
            final tab = state.pathParameters['tab']!;
            return MainNavigationScreen(tab: tab);
          },
        ),
      ],
    );
  },
);
