import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/features/login/screens/login_screen.dart';
import 'package:thread_clone/features/login/view_models/signup_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/signup";
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widgetbuild(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Email",
            ),
            onChanged: (value) {
              final state = ref.read(signUpForm.notifier).state;
              ref.read(signUpForm.notifier).state = {...state, "email": value};
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Password",
            ),
            onChanged: (value) {
              final state = ref.read(signUpForm.notifier).state;
              ref.read(signUpForm.notifier).state = {
                ...state,
                "password": value
              };
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(signUpProvider.notifier).signUp(context);
            },
            child: const Text("signup"),
          ),
          GestureDetector(
            onTap: () {
              context.go(LoginScreen.routeURL);
            },
            child: const Text("Log In"),
          ),
        ],
      ),
    );
  }
}
