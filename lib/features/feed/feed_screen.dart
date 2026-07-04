import 'package:flutter/material.dart';
import 'widgets/video_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context,index){

          return VideoCard(
            username: "@pitoktube",
            description: "PitokTube MVP geliştirme devam ediyor 🚀",
            likes: 1452,
            comments: 231,
          );

        },
      ),
    );
  }
}