import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/feed/models/video_model.dart';
import '../repositories/video_repository.dart';

final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepository();
});

final feedProvider = FutureProvider<List<VideoModel>>((ref) async {
  return ref.read(videoRepositoryProvider).getFeed();
});