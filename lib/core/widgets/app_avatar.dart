import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final double radius;
  final String? imageUrl;

  const AppAvatar({
    super.key,
    this.radius = 28,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFF7C3AED),
      backgroundImage:
          imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!)
              : null,
      child: imageUrl == null || imageUrl!.isEmpty
          ? Icon(
              Icons.person,
              size: radius,
              color: Colors.white,
            )
          : null,
    );
  }
}