// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';

class PlayersApi {
  Dio dioClient = Dio();
  final baseUrl = 'https://6573803a063f876cec9cf9f6.mockapi.io/';

  static final PlayersApi _instance = PlayersApi._internal();

  factory PlayersApi() {
    _instance.dioClient.interceptors.add(getInterceptor());
    return _instance;
  }

  PlayersApi._internal();

  Dio get dio => dioClient;

  static InterceptorsWrapper getInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      },
    );
  }
}
