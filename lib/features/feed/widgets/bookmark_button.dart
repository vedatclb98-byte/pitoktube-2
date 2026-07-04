import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          saved = !saved;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              saved
                  ? "Video kaydedildi."
                  : "Video kayıtlardan kaldırıldı.",
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      icon: Icon(
        saved ? Icons.bookmark : Icons.bookmark_border,
        size: 36,
        color: saved ? const Color(0xFF7C3AED) : Colors.white,
      ),
    );
  }
}