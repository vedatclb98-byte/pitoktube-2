import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(user.username),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(user.photoUrl),
          ),

          const SizedBox(height: 15),

          Text(
            user.username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            user.bio,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Column(
                children: [
                  Text("0", style: TextStyle(color: Colors.white)),
                  Text("Followers", style: TextStyle(color: Colors.white70)),
                ],
              ),
              Column(
                children: [
                  Text("0", style: TextStyle(color: Colors.white)),
                  Text("Following", style: TextStyle(color: Colors.white70)),
                ],
              ),
              Column(
                children: [
                  Text("0", style: TextStyle(color: Colors.white)),
                  Text("Videos", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}