import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/video_repository.dart';
import '../models/video_model.dart';

final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepository();
});

final feedProvider = StreamProvider<List<VideoModel>>((ref) {
  final repo = ref.read(videoRepositoryProvider);
  return repo.getFeedStream();
});