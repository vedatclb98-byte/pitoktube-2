class LikeRepository {
  final Set<String> _likedVideos = {};

  Future<bool> isLiked(String videoId) async {
    return _likedVideos.contains(videoId);
  }

  Future<int> toggleLike({
    required String videoId,
    required int currentLikes,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

    if (_likedVideos.contains(videoId)) {
      _likedVideos.remove(videoId);
      return currentLikes - 1;
    } else {
      _likedVideos.add(videoId);
      return currentLikes + 1;
    }
  }
}