class CreatorModel {
  final String id;
  final String username;
  final bool verified;
  final bool piCreator;
  final double totalTips;
  final int followers;

  const CreatorModel({
    required this.id,
    required this.username,
    required this.verified,
    required this.piCreator,
    required this.totalTips,
    required this.followers,
  });
}