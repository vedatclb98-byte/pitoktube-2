import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/auth_provider.dart';
import 'features/auth/login_screen.dart';
import 'widgets/bottom_navigation.dart';

class PitokTubeApp extends ConsumerWidget {
  const PitokTubeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PitokTube',
      theme: ThemeData.dark(),

      home: authState.when(
        data: (user) {
          if (user != null) {
            return const BottomNavigation(); // giriş yaptıysa ana uygulama
          } else {
            return const LoginScreen(); // giriş yoksa login
          }
        },
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => Scaffold(
          body: Center(child: Text("Hata: $e")),
        ),
      ),
    );
  }
}