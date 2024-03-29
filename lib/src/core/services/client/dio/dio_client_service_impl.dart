import 'package:dio/dio.dart';
import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/core/services/client/dio/custom_dio.dart';
import 'package:ezoom_todolist/src/core/services/client/dtos/client_request.dart';
import 'package:ezoom_todolist/src/core/services/client/dtos/client_response.dart';
import 'package:ezoom_todolist/src/core/services/client/exceptions/client_exception.dart';

class DioClientService implements ClientService {
  final CustomDio dio;

  const DioClientService({
    required this.dio,
  });

  @override
  Future<ClientResponse> delete(ClientRequest clientRequest) async {
    try {
      final response = await dio.delete(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<ClientResponse> get(ClientRequest clientRequest) async {
    try {
      final response = await dio.get(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<ClientResponse> post(ClientRequest clientRequest) async {
    try {
      final response = await dio.post(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<ClientResponse> put(ClientRequest clientRequest) async {
    try {
      final response = await dio.put(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }
}
