import 'package:dio/dio.dart';
import 'package:jakomo_recliner/ServerData/history_output_model.dart';
import 'package:retrofit/http.dart';

import 'api_constant.dart';

part 'history_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HistoryClient {
  factory HistoryClient(Dio dio, {String baseUrl}) = _HistoryClient;

  @GET("/api/history")
  Future<List<HistoryOutPutModel>> getAllHistory(@Query("start") start,
      @Query("end") end, @Query("filterType") filterType);
}
