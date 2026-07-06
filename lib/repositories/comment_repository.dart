import '../models/comment_model.dart';

class CommentRepository {
  final List<CommentModel> _comments = [];

  Future<List<CommentModel>> getComments(String videoId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return _comments.where((c) => c.videoId == videoId).toList();
  }

  Future<void> addComment(CommentModel comment) async {
    await Future.delayed(const Duration(milliseconds: 200));

    _comments.add(comment);
  }
}