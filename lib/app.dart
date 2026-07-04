import 'package:flutter/material.dart';

class PitokTubeApp extends StatelessWidget {
  const PitokTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PitokTube',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text(
            'PitokTube',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}