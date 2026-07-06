import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/admin_repository.dart';
import '../models/admin_stats_model.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository();
});

final adminStatsProvider =
    FutureProvider<AdminStatsModel>((ref) async {
  final repo = ref.read(adminRepositoryProvider);
  return repo.getStats();
});