import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/search/models/saerch_user_model.dart';
import 'package:thread_clone/features/search/repos/search_repo.dart';

class SearchViewModel extends AsyncNotifier<List<SearchUserModel>> {
  late final SearchRepo _searchRepo;
  List<SearchUserModel> _searchUsers = [];

  @override
  FutureOr<List<SearchUserModel>> build() async {
    _searchRepo = ref.read(searchRepo);

    _searchUsers = await _getSearchUser();
    return _searchUsers;
  }

  Future<List<SearchUserModel>> _getSearchUser({String? query}) async {
    final results = await _searchRepo.searchUser(query: query);
    final searchUsers = results.docs
        .map((doc) => SearchUserModel.fromJson(doc.data()))
        .toList();
    print("searchUsers: $searchUsers");
    return searchUsers;
  }

  Future<void> searchUser({String? query}) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(() async {
      _searchUsers = await _getSearchUser(query: query);
      state = AsyncValue.data(_searchUsers);
    });
  }
}

final searchProvider =
    AsyncNotifierProvider<SearchViewModel, List<SearchUserModel>>(
  () => SearchViewModel(),
);
