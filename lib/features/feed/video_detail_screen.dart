import 'package:flutter/material.dart';

import '../../repositories/comment_repository.dart';
import '../../models/video_model.dart';
import '../../models/comment_model.dart';

class VideoDetailScreen extends StatefulWidget {
  final VideoModel video;

  const VideoDetailScreen({
    super.key,
    required this.video,
  });

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  final CommentRepository _repo = CommentRepository();
  late Future<List<CommentModel>> _commentsFuture;

  @override
  void initState() {
    super.initState();
    _commentsFuture = _repo.getComments(widget.video.id);
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(video.username),
      ),
      body: Column(
        children: [
          // Video alanı (şimdilik placeholder)
          Container(
            height: 250,
            color: Colors.grey.shade900,
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: FutureBuilder(
              future: _commentsFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final comments = snapshot.data!;

                return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];

                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        comment.username,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        comment.text,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}