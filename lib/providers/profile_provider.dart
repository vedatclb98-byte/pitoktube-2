import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/follow_repository.dart';

final followRepositoryProvider = Provider<FollowRepository>((ref) {
  return FollowRepository();
});

final followersCountProvider =
    FutureProvider.family<int, String>((ref, userId) async {
  final repo = ref.read(followRepositoryProvider);
  return repo.getFollowersCount(userId);
});

final followingCountProvider =
    FutureProvider.family<int, String>((ref, userId) async {
  final repo = ref.read(followRepositoryProvider);
  return repo.getFollowingCount(userId);
});