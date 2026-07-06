import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/follow_repository.dart';

final followRepositoryProvider = Provider<FollowRepository>((ref) {
  return FollowRepository();
});

final followStatusProvider =
    FutureProvider.family<bool, Map<String, String>>((ref, ids) async {
  final repo = ref.read(followRepositoryProvider);

  return repo.isFollowing(
    currentUserId: ids["currentUserId"]!,
    targetUserId: ids["targetUserId"]!,
  );
});