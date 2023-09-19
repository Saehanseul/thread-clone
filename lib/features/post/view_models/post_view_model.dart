import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/post/repos/post_repo.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepo _postRepo;
  @override
  FutureOr<void> build() {
    _postRepo = ref.read(postRepo);
  }

  Future<void> postUpload(String text, File? file) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(() async {
      await _postRepo.addPost(text: text, file: file);
    });
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
