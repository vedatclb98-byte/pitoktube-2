class EarningsService {
  // 💰 PI KAZANÇ FORMÜLÜ
  double calculateEarnings({
    required int views,
    required int watchTime,
    required int likes,
    required int comments,
  }) {
    double earnings = 0;

    // 👀 view değeri düşük
    earnings += views * 0.0001;

    // ⏱ watch time en önemli
    earnings += watchTime * 0.0005;

    // ❤️ engagement
    earnings += likes * 0.001;
    earnings += comments * 0.002;

    return earnings;
  }
}