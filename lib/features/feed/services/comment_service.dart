import '../models/comment_model.dart';

class CommentService {
  List<CommentModel> getComments() {
    return [
      CommentModel(
        id: "1",
        userId: "u1",
        username: "@pitoktube",
        text: "PitokTube'a hoş geldiniz! 🚀",
        createdAt: DateTime.now(),
        likes: 12,
      ),
      CommentModel(
        id: "2",
        userId: "u2",
        username: "@flutterdev",
        text: "Harika görünüyor 💜",
        createdAt: DateTime.now(),
        likes: 5,
      ),
    ];
  }
}