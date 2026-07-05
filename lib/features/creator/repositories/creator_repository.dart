import '../models/creator_model.dart';

class CreatorRepository {
  CreatorModel getCreator() {
    return const CreatorModel(
      id: "1",
      username: "@pitoktube",
      verified: true,
      piCreator: true,
      totalTips: 254.75,
      followers: 12890,
    );
  }
}