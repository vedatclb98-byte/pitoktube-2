class AdminStatsModel {
  final int totalUsers;
  final int totalVideos;
  final int totalViews;
  final int totalReports;

  AdminStatsModel({
    required this.totalUsers,
    required this.totalVideos,
    required this.totalViews,
    required this.totalReports,
  });

  Map<String, dynamic> toMap() {
    return {
      "totalUsers": totalUsers,
      "totalVideos": totalVideos,
      "totalViews": totalViews,
      "totalReports": totalReports,
    };
  }

  factory AdminStatsModel.fromMap(Map<String, dynamic> map) {
    return AdminStatsModel(
      totalUsers: map["totalUsers"] ?? 0,
      totalVideos: map["totalVideos"] ?? 0,
      totalViews: map["totalViews"] ?? 0,
      totalReports: map["totalReports"] ?? 0,
    );
  }
}