import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _repository = UserRepository();

  UserModel getCurrentUser() {
    return _repository.getCurrentUser();
  }
}