import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/video_repository.dart';
import '../models/video_model.dart';

final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepository();
});

// 🧠 PERSONAL FEED PROVIDER
final personalFeedProvider =
    StreamProvider.family<List<VideoModel>, String>((ref, userId) {
  final repo = ref.read(videoRepositoryProvider);
  return repo.getPersonalFeed(userId: userId);
});