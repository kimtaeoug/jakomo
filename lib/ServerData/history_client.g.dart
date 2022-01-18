// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HistoryClient implements HistoryClient {
  _HistoryClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://183.99.48.93:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<HistoryOutPutModel>> getAllHistory(start, end, filterType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'start': start,
      r'end': end,
      r'filterType': filterType
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<HistoryOutPutModel>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/history',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            HistoryOutPutModel.fromJson(i as Map<String, dynamic>))
        .toList();
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
