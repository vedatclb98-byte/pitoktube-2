import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final int initialLikes;

  const LikeButton({
    super.key,
    required this.initialLikes,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool liked;
  late int likes;

  @override
  void initState() {
    super.initState();
    liked = false;
    likes = widget.initialLikes;
  }

  void toggleLike() {
    setState(() {
      liked = !liked;

      if (liked) {
        likes++;
      } else {
        likes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: toggleLike,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(liked),
              color: liked ? Colors.pink : Colors.white,
              size: 36,
            ),
          ),
        ),
        Text(
          "$likes",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}