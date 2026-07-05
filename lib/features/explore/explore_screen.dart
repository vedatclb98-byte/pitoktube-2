import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trending = [
      "#PiNetwork",
      "#PitokTube",
      "#Flutter",
      "#Crypto",
      "#Web3",
      "#Creator",
      "#Live",
      "#Mining",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keşfet"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Video, kullanıcı veya etiket ara...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Trend Etiketler",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: trending
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 30),

          const Text(
            "Öne Çıkan Creator'lar",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...List.generate(
            5,
            (index) => ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF7C3AED),
                child: Icon(Icons.person),
              ),
              title: Text("@creator$index"),
              subtitle: const Text("Pi Creator"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text("Takip Et"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}