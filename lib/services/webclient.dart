import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:app_livraria_flutter/services/http_interceptors.dart';

class WebClient {
  static const String url = "http://localhost:3000/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );
}
