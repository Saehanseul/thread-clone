import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class loginScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/login";
  const loginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _loginScreenState();
}

class _loginScreenState extends ConsumerState<loginScreen> {
  @override
  Widgetbuild(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
