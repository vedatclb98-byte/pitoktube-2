import '../models/creator_model.dart';
import '../repositories/creator_repository.dart';

class CreatorService {
  final CreatorRepository _repository = CreatorRepository();

  CreatorModel getCreator() {
    return _repository.getCreator();
  }
}