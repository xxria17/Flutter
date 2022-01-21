// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ListApi implements ListApi {
  _ListApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dapi.kakao.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ImgListResponse> getResultList(
      {size = 30, type = "accuracy", required page, required query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'sort': type,
      r'page': page,
      r'query': query
    };
    final _headers = <String, dynamic>{
      r'Authorization': 'KakaoAK 74699f722350a89fa49a716a1c8e230b'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImgListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/search/image',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImgListResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
