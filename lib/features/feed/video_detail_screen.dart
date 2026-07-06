import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../../models/comment_model.dart';
import '../../repositories/comment_repository.dart';

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
  final TextEditingController _controller = TextEditingController();

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
          // Video placeholder
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

          // Comments list
          Expanded(
            child: FutureBuilder(
              future: _commentsFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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

          // Comment input
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Yorum yaz...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () async {
                    if (_controller.text.trim().isEmpty) return;

                    final comment = CommentModel(
                      id: DateTime.now().toString(),
                      videoId: widget.video.id,
                      userId: "me",
                      username: "@user",
                      text: _controller.text.trim(),
                      createdAt: DateTime.now(),
                      likes: 0,
                    );

                    await _repo.addComment(comment);

                    setState(() {
                      _commentsFuture =
                          _repo.getComments(widget.video.id);
                      _controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}