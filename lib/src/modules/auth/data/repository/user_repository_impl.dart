// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/core/services/client/dtos/client_request.dart';
import 'package:ezoom_todolist/src/modules/auth/consts/user_endpoints.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;

  UserRepositoryImpl({
    required this.clientService,
  });
  @override
  Future<String> authenticated(User user) async {
    String basicAuth = 'Basic ${base64.encode(
      utf8.encode('${user.username}:${user.password}'),
    )}';

    final result = await clientService.post(
      ClientRequest(
        path: UserEndpoints.login,
        data: user.toJson(),
        headers: {
          "Authorization": basicAuth,
        },
      ),
    );

    return result.body;
  }

  @override
  Future<void> registerUser(User user) async {
    await clientService.post(
      ClientRequest(
        path: UserEndpoints.register,
        data: user.toJson(),
      ),
    );
  }
}
