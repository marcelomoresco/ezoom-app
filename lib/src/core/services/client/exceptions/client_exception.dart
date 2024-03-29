import 'package:ezoom_todolist/src/core/exceptions/ezoom_exception.dart';

class ClientException extends EzoomException {
  final int statusCode;

  ClientException({
    required super.message,
    required this.statusCode,
  });
}
