import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String username;

  const ChatScreen({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: _messageBubble(
                    "Merhaba 👋",
                    false,
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: _messageBubble(
                    "Merhaba, nasılsın?",
                    true,
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: _messageBubble(
                    "PitokTube çok güzel olmuş 🚀",
                    false,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Mesaj yaz...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  FloatingActionButton(
                    mini: true,
                    onPressed: () {},
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageBubble(String text, bool mine) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: mine
            ? const Color(0xFF7C3AED)
            : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}