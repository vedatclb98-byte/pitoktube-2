import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trending = [
      "#PiNetwork",
      "#Flutter",
      "#Crypto",
      "#Web3",
      "#PitokTube",
      "#Blockchain",
      "#AI",
      "#Stellar",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ara"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Video, kullanıcı veya etiket ara...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trend Etiketler",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),
                        Wrap(
              spacing: 10,
              runSpacing: 10,
              children: trending.map((tag) {
                return Chip(
                  avatar: const Icon(
                    Icons.trending_up,
                    color: Color(0xFF7C3AED),
                    size: 18,
                  ),
                  label: Text(tag),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popüler Aramalar",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Pi Network"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Flutter"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("AI Creator"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Web3"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Stellar"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ),
                      ],
        ),
      ),
    );
  }
}