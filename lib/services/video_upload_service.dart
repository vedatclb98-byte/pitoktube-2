import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class VideoUploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadVideo(File file) async {
    final id = const Uuid().v4();

    final ref = _storage.ref().child("videos/$id.mp4");

    await ref.putFile(file);

    final url = await ref.getDownloadURL();

    return url;
  }
}