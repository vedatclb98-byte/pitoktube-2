import 'package:flutter/material.dart';
import 'widgets/bottom_navigation.dart';

class PitokTubeApp extends StatelessWidget {
  const PitokTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PitokTube',
      theme: ThemeData.dark(),
      home: const BottomNavigation(),
    );
  }
}