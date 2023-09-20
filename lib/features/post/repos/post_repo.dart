import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addPost({
    required String text,
    File? file,
  }) async {
    final fileRef = _storage.ref().child("images/${DateTime.now()}");
    late final TaskSnapshot? uploadTask;
    try {
      uploadTask = await fileRef.putFile(file!);
    } catch (e) {
      print("Error: $e");
      uploadTask = null;
    }

    late final String? imageUrl;

    if (uploadTask != null && uploadTask.state == TaskState.success) {
      imageUrl =
          "https://firebasestorage.googleapis.com/v0/b/thread-practice.appspot.com/o/images%2F${uploadTask.ref.name}?alt=media";
    } else {
      imageUrl = null;
    }
    try {
      final res = await _db.collection("posts").add({
        "text": text,
        "imageUrl": imageUrl,
        "createdAt": DateTime.now(),
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPosts() async {
    final res = await _db
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .get();

    return res;
  }
}

final postRepo = Provider((ref) => PostRepo());
