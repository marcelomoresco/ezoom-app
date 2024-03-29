import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/repositories/user_repository.dart';

class RegisterUserUsecase {
  final UserRepository userRepository;
  RegisterUserUsecase({required this.userRepository});

  Future<void> call(User user) {
    return userRepository.registerUser(user);
  }
}
