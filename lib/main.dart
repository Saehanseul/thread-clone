import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/settings/view_models/dark_mode_view_model.dart';
import 'package:thread_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 앱 시작전에 초기화
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: ThreadApp()));
}

class ThreadApp extends ConsumerWidget {
  const ThreadApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: "Thread clone",
      themeMode: ref.watch(darkModeProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteMountainView,
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.white,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
