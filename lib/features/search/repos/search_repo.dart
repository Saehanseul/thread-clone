import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> searchUser(
      {String? query}) async {
    final res =
        await _db.collection("users").where("name", isEqualTo: query).get();
    print("res: $res");
    return res;
  }
}

final searchRepo = Provider((ref) => SearchRepo());
