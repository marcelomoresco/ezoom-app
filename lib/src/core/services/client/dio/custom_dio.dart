import 'package:dio/io.dart';
import 'package:ezoom_todolist/src/core/services/client/interceptors/header_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    _configureDio();
  }

  void _configureDio() {
    options.baseUrl = "http://ec2-3-92-56-46.compute-1.amazonaws.com:8080";
    interceptors.add(HeaderInterceptor());
    options.connectTimeout = const Duration(seconds: 30);
    options.sendTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
  }
}
