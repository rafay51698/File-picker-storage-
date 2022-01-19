import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> uploadFile(String filepath, String filename) async {
    File file = File(filepath);
    try {
      await storage.ref('test/filename').putFile(file);
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
