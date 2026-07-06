class EarningsModel {
  final String userId;

  final int totalViews;
  final int totalWatchTime;
  final int totalLikes;
  final int totalComments;

  final double piBalance;

  EarningsModel({
    required this.userId,
    required this.totalViews,
    required this.totalWatchTime,
    required this.totalLikes,
    required this.totalComments,
    required this.piBalance,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "totalViews": totalViews,
      "totalWatchTime": totalWatchTime,
      "totalLikes": totalLikes,
      "totalComments": totalComments,
      "piBalance": piBalance,
    };
  }
}