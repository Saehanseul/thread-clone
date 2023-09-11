import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/main_navigation_screen.dart';
import 'package:thread_clone/features/home/screens/comment_screen.dart';
import 'package:thread_clone/features/post/views/screens/take_picker_screen.dart';
import 'package:thread_clone/features/settings/screens/privacy_screen.dart';
import 'package:thread_clone/features/settings/screens/settings_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: "/:tab(|search|write|activity|profile)",
          builder: (context, state) {
            final tab = state.pathParameters['tab']!;
            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          path: CommentScreen.routeURL,
          builder: (context, state) => const CommentScreen(),
        ),
        GoRoute(
          path: SettingsScreen.routeURL,
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: PrivacyScreen.routeURL,
          builder: (context, state) => const PrivacyScreen(),
        ),
        GoRoute(
          path: TakePictureScreen.routeURL,
          builder: (context, state) => const TakePictureScreen(),
        )
      ],
    );
  },
);
