import 'package:dio/dio.dart';
import 'package:jakomo_recliner/MeasureAPI/measure_input_model.dart';
import 'package:jakomo_recliner/MeasureAPI/measure_result_model.dart';
import 'package:retrofit/http.dart';
part 'measure_api.g.dart';
@RestApi(baseUrl: "http://183.99.48.93:8080/")
abstract class MeasureAPI{
  factory MeasureAPI(Dio dio, {String baseUrl}) = _MeasureAPI;
  @POST("api/raw")
  Future<MeasureResultModel> requestMeasureResult(@Body() MeasureInputModel measureInputModel);
}