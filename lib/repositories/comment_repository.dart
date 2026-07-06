import '../models/comment_model.dart';

class CommentRepository {
  Future<List<CommentModel>> getComments(String videoId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      CommentModel(
        id: "1",
        videoId: videoId,
        userId: "101",
        username: "@piuser",
        text: "Harika video 👏",
        createdAt: DateTime.now(),
        likes: 12,
      ),
      CommentModel(
        id: "2",
        videoId: videoId,
        userId: "102",
        username: "@flutterdev",
        text: "Devamını bekliyoruz 🚀",
        createdAt: DateTime.now(),
        likes: 8,
      ),
    ];
  }
}