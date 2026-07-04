import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        "name": "PitokTube",
        "message": "PitokTube'ya hoş geldin! 🚀",
        "time": "09:41"
      },
      {
        "name": "Flutter Dev",
        "message": "Yeni video yükledim.",
        "time": "Dün"
      },
      {
        "name": "Pi Creator",
        "message": "Bahşiş için teşekkürler 💜",
        "time": "Pzt"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];

          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF7C3AED),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              chat["name"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat["message"]!),
            trailing: Text(chat["time"]!),
            onTap: () {},
          );
        },
      ),
    );
  }
}