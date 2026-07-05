import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String username;

  const ChatScreen({
    super.key,
    required this.username,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController =
      TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "text": "Merhaba 👋",
      "me": false,
    },
    {
      "text": "Selam 🚀",
      "me": true,
    },
    {
      "text": "Yeni videonu izledim.",
      "me": false,
    },
    {
      "text": "Teşekkür ederim ❤️",
      "me": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFF7C3AED),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(widget.username),

                  const Text(
                    "Çevrimiçi",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
                  alignment: message["me"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: message["me"]
                          ? const Color(0xFF7C3AED)
                          : const Color(0xFF1E1E1E),
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                    child: Text(
                      message["text"],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF15151C),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                    ),
                  ),

                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Mesaj yaz...",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file),
                  ),

                  IconButton(
                    onPressed: () {
                      if (messageController.text.isEmpty) {
                        return;
                      }

                      setState(() {
                        messages.add({
                          "text": messageController.text,
                          "me": true,
                        });
                      });

                      messageController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xFF7C3AED),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}