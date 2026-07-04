import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hashtags = [
      "#PiNetwork",
      "#Crypto",
      "#Flutter",
      "#Gaming",
      "#AI",
      "#Music",
      "#Technology",
      "#Travel",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keşfet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Video, kullanıcı veya hashtag ara...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 45,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: hashtags.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(hashtags[index]),
                    backgroundColor: const Color(0xFF7C3AED),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: 24,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .75,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF15151C),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Color(0xFF7C3AED),
                          ),
                        ),

                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text("12.5K"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}