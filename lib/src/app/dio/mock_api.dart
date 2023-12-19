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
        // Pode adicionar lógica de interceptação aqui, se necessário
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // Pode adicionar lógica de interceptação aqui, se necessário
        return handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        // Pode adicionar lógica de interceptação aqui, se necessário
        return handler.next(error);
      },
    );
  }
}
