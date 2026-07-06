import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/video_model.dart';
import '../../repositories/video_repository.dart';
import '../../services/video_upload_service.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _video;
  final picker = ImagePicker();

  final VideoUploadService _uploadService = VideoUploadService();
  final VideoRepository _repo = VideoRepository();

  Future<void> pickVideo() async {
    final picked = await picker.pickVideo(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _video = File(picked.path);
      });
    }
  }

  Future<void> upload() async {
    if (_video == null) return;

    final url = await _uploadService.uploadVideo(_video!);

    final video = VideoModel(
      id: DateTime.now().toString(),
      userId: "user123",
      username: "@user",
      videoUrl: url,
      description: "Yeni video",
      likes: 0,
      comments: 0,
      createdAt: DateTime.now(),
    );

    await _repo.uploadVideo(video);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Video yüklendi!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Video")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: pickVideo,
            child: const Text("Video Seç"),
          ),
          if (_video != null)
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Video seçildi"),
            ),
          ElevatedButton(
            onPressed: upload,
            child: const Text("Upload"),
          ),
        ],
      ),
    );
  }
}