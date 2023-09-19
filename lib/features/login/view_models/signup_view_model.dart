import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/features/login/repos/auth_repo.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthRepo _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);

    print('form: $form');

    state = await AsyncValue.guard(
      () async {
        print('async: ${form['email'].runtimeType}');
        final userCredential = await _authRepo.emailSignUp(
          email: form['email']!,
          password: form['password']!,
        );
        print("after async");
        if (userCredential.user != null) {
          context.go("/");
        }
      },
    );
  }

  Future<void> signOut(BuildContext context) async {
    await _authRepo.signOut();
    context.go("/");
  }

  Future<void> signIn(BuildContext context) async {
    print('signIn');
    state = const AsyncValue.loading();
    final form = ref.read(signInForm);
    print('form: $form');
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.signIn(
          email: form['email']!, password: form['password']!);
      print("userCredential: $userCredential");
      if (userCredential.user != null) {
        context.go("/");
      }
    });
  }
}

final signUpForm = StateProvider<Map<String, String>>((ref) => {});

final signInForm = StateProvider<Map<String, String>>((ref) => {});

final signUpProvider =
    AsyncNotifierProvider<SignUpViewModel, void>(() => SignUpViewModel());
