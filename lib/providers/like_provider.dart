import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/like_repository.dart';

final likeRepositoryProvider = Provider<LikeRepository>((ref) {
  return LikeRepository();
});

final likedVideosProvider =
    StateNotifierProvider<LikeNotifier, Set<String>>((ref) {
  return LikeNotifier(ref.read(likeRepositoryProvider));
});

class LikeNotifier extends StateNotifier<Set<String>> {
  final LikeRepository _repo;

  LikeNotifier(this._repo) : super({});

  Future<void> toggleLike(String videoId, int currentLikes) async {
    final isLiked = state.contains(videoId);

    await _repo.toggleLike(
      videoId: videoId,
      currentLikes: currentLikes,
    );

    if (isLiked) {
      state = {...state}..remove(videoId);
    } else {
      state = {...state, videoId};
    }
  }

  bool isLiked(String videoId) {
    return state.contains(videoId);
  }
}