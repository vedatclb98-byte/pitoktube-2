import '../models/user_model.dart';
import '../models/user_role.dart';

class UserRepository {
  Future<UserModel> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const UserModel(
      id: "1",
      username: "@pitoktube",
      displayName: "PitokTube",
      photoUrl: null,
      bio: "Pi Network Creator Platform",
      verified: true,
      kycVerified: true,
      followers: 12400,
      following: 245,
      likes: 84900,
      piBalance: 32.50,
      role: UserRole.admin,
    );
  }
}