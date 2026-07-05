import '../models/user_model.dart';

class UserRepository {
  UserModel getCurrentUser() {
    return const UserModel(
      id: "u1",
      username: "@pitoktube",
      displayName: "PitokTube Official",
      avatarUrl: "",
      verified: true,
      piCreator: true,
    );
  }
}