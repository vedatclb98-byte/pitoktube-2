import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/admin_provider.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(adminStatsProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.black,
      ),
      body: stats.when(
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _tile("Users", data.totalUsers),
              _tile("Videos", data.totalVideos),
              _tile("Views", data.totalViews),
              _tile("Reports", data.totalReports),
            ],
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Hata: $e")),
      ),
    );
  }

  Widget _tile(String title, int value) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        "$title: $value",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}