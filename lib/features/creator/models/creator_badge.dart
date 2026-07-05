enum CreatorBadgeType {
  verified,
  piCreator,
  topCreator,
  moderator,
}

class CreatorBadge {
  final CreatorBadgeType type;
  final String title;

  const CreatorBadge({
    required this.type,
    required this.title,
  });
}