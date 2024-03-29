import 'package:ezoom_todolist/src/core/services/client/dtos/client_request.dart';
import 'package:ezoom_todolist/src/core/services/client/dtos/client_response.dart';

abstract interface class ClientService {
  Future<ClientResponse> get(ClientRequest clientRequest);
  Future<ClientResponse> post(ClientRequest clientRequest);
  Future<ClientResponse> put(ClientRequest clientRequest);
  Future<ClientResponse> delete(ClientRequest clientRequest);
}
