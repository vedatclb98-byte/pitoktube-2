import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 38,
      onPressed: () {
        setState(() {
          liked = !liked;
        });
      },
      icon: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.red : Colors.white,
      ),
    );
  }
}