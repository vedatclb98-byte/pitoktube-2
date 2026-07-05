class SearchResult {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final SearchType type;

  const SearchResult({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.type,
  });
}

enum SearchType {
  user,
  video,
  hashtag,
}