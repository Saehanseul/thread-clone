import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/post/models/post_model.dart';
import 'package:thread_clone/features/post/repos/post_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostRepo _postRepo;
  List<PostModel> _posts = [];

  Future<List<PostModel>> _getPosts() async {
    final results = await _postRepo.getPosts();
    final posts =
        results.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
    return posts;
  }

  @override
  FutureOr<List<PostModel>> build() async {
    _postRepo = ref.read(postRepo);

    _posts = await _getPosts();
    return _posts;
  }

  FutureOr<void> refresh() async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(() async {
      _posts = await _getPosts();
      state = AsyncValue.data(_posts);
    });
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<PostModel>>(
  () => TimelineViewModel(),
);
