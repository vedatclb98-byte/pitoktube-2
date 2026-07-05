import '../models/search_result.dart';
import '../repositories/search_repository.dart';

class SearchService {
  final SearchRepository _repository = SearchRepository();

  List<SearchResult> search(String query) {
    return _repository.search(query);
  }
}