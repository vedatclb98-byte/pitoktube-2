import 'package:flutter/material.dart';

class AnimatedHeart extends StatelessWidget {
  final bool visible;

  const AnimatedHeart({
    super.key,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: const Center(
          child: Icon(
            Icons.favorite,
            size: 130,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}