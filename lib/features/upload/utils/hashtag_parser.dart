class HashtagParser {
  static List<String> extract(String text) {
    final regex = RegExp(r'#(\w+)');

    return regex
        .allMatches(text)
        .map((e) => e.group(0)!)
        .toList();
  }
}