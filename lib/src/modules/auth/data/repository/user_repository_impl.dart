// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;

  UserRepositoryImpl({
    required this.clientService,
  });
  @override
  Future<String> authenticated(User user) {
    // TODO: implement authenticated
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(User user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
