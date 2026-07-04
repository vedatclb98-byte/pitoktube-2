import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [

              Container(
                color: Colors.grey.shade900,
              ),

              Center(
                child: Text(
                  "Video ${index + 1}",
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Positioned(
                right: 15,
                bottom: 120,
                child: Column(
                  children: const [

                    Icon(
                      Icons.favorite_border,
                      size: 38,
                    ),

                    SizedBox(height: 25),

                    Icon(
                      Icons.chat_bubble_outline,
                      size: 38,
                    ),

                    SizedBox(height: 25),

                    Icon(
                      Icons.share,
                      size: 38,
                    ),
                  ],
                ),
              ),

              const Positioned(
                left: 15,
                bottom: 30,
                child: Text(
                  "@PitokTube",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}