// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MeasureAPI implements MeasureAPI {
  _MeasureAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://183.99.48.93:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MeasureResultModel> requestMeasureResult(measureInputModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(measureInputModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MeasureResultModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'api/raw',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MeasureResultModel.fromJson(_result.data!);
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
