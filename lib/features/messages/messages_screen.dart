import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, dynamic>> chats = [
    {
      "name": "Pi Creator",
      "message": "Yeni videonu izledim 🚀",
      "time": "10:24",
      "online": true,
      "unread": 2,
    },
    {
      "name": "Flutter Türkiye",
      "message": "Canlı yayın ne zaman?",
      "time": "09:42",
      "online": false,
      "unread": 0,
    },
    {
      "name": "Crypto News",
      "message": "Pi hakkında son gelişmeleri gördün mü?",
      "time": "Dün",
      "online": true,
      "unread": 4,
    },
    {
      "name": "Web3 Community",
      "message": "Toplantı bugün 20:00'de.",
      "time": "Dün",
      "online": false,
      "unread": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Sohbet ara...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
                    Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ListTile(
                  leading: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFF7C3AED),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      if (chat["online"])
                        const Positioned(
                          bottom: 2,
                          right: 2,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.green,
                          ),
                        ),
                    ],
                  ),

                  title: Text(
                    chat["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    chat["message"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat["time"],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 6),

                      if (chat["unread"] > 0)
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: const Color(0xFF7C3AED),
                          child: Text(
                            "${chat["unread"]}",
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),

                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${chat["name"]} ile sohbet ekranı yakında eklenecek.",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
                  ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}