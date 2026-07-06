import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment_model.dart';

class CommentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CommentModel>> getComments(String videoId) async {
    final snapshot = await _firestore
        .collection('comments')
        .where('videoId', isEqualTo: videoId)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return CommentModel.fromMap(doc.data());
    }).toList();
  }

  Future<void> addComment(CommentModel comment) async {
    await _firestore.collection('comments').add(comment.toMap());
  }
}