import 'package:image_search/data/response/img_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import '../../const.dart';

part 'list_api.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ListApi {
  factory ListApi(Dio dio, {String baseUrl}) = _ListApi;

  @GET("v2/search/image")
  @Headers(<String, dynamic>{"Authorization": Const.API_KEY})
  Future<ImgListResponse> getResultList({
    @Query("size") int size = 30,
    @Query("sort") String type = "accuracy",
    @Query("page") required int page,
    @Query("query") required String query
  });
}
