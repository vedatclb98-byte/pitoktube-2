import '../models/search_result.dart';

class SearchRepository {
  List<SearchResult> search(String query) {
    return [
      SearchResult(
        id: "1",
        title: "@pitoktube",
        subtitle: "Resmi PitokTube Hesabı",
        imageUrl: "",
        type: SearchType.user,
      ),
      SearchResult(
        id: "2",
        title: "#PiNetwork",
        subtitle: "Trend etiketi",
        imageUrl: "",
        type: SearchType.hashtag,
      ),
    ];
  }
}