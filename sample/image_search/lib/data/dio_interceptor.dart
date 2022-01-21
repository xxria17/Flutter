import 'package:dio/dio.dart';
import '../main.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["service-type"] = "";
    logger.d(
        'REQUEST[${options.method}] => PATH: ${options.uri}, QUERY: ${options.queryParameters.toString()}, HEADER: ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.uri}\nData: ${response.data}');
    handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.uri}');
    handler.reject(err);
  }
}