import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<void> registerUser(User user);
  Future<String> authenticated(User user);
}
