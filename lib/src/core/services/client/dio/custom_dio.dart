import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    _configureDio();
  }

  void _configureDio() {
    //options.baseUrl = Environment.apiBaseUrl;
    options.connectTimeout = const Duration(seconds: 30);
    options.sendTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
  }
}
