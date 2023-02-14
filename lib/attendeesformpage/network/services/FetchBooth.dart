import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'FetchBooth.g.dart';

@RestApi(baseUrl: "https://staging.mannkibaatprogram.in/")
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('api/event_tracker/ac_sks')
  @Headers({"Content-Type": "application/json", "Accept": 'application/json'})
  Future<HttpResponse> fetchAc(
      @Header('Authorization') token, @Field("ac_id") String data);

  @POST('api/event_tracker/get_sk_booth')
  @Headers({"Content-Type": "application/json", "Accept": 'application/json'})
  Future<HttpResponse> fetchBooth(
      @Header('Authorization') token, @Field("sk_id") String data);
}
