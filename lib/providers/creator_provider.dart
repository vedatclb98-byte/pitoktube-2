import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/creator_repository.dart';
import '../models/video_model.dart';

final creatorRepositoryProvider = Provider<CreatorRepository>((ref) {
  return CreatorRepository();
});

// 🎥 MY VIDEOS
final myVideosProvider =
    StreamProvider.family<List<VideoModel>, String>((ref, userId) {
  final repo = ref.read(creatorRepositoryProvider);
  return repo.getMyVideos(userId);
});

// 📊 STATS
final creatorStatsProvider =
    FutureProvider.family<Map<String, int>, String>((ref, userId) {
  final repo = ref.read(creatorRepositoryProvider);
  return repo.getStats(userId);
});