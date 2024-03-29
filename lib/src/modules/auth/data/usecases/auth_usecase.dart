import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthUsecase {
  final UserRepository userRepository;

  AuthUsecase({required this.userRepository});

  Future<void> call(User user) async {
    final token = await userRepository.authenticated(user);
    const storage = FlutterSecureStorage();
    await storage.write(key: "user_token", value: token);
  }
}
