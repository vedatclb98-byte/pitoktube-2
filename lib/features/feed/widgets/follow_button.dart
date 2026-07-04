import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool following = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          following = !following;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            following ? Colors.grey.shade700 : const Color(0xFF7C3AED),
        foregroundColor: Colors.white,
        minimumSize: const Size(90, 38),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        following ? "Takip Ediliyor" : "Takip Et",
      ),
    );
  }
}