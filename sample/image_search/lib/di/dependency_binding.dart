import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_search/data/dio_interceptor.dart';
import 'package:image_search/data/repository/list_api.dart';
import 'package:image_search/ui/detail/detail_view_model.dart';
import 'package:image_search/ui/list/list_view_model.dart';

class DefaultDependencyBinding implements Bindings {
  @override
  void dependencies() {

    Get.put<Dio>(_buildDio());
    Get.lazyPut<ListApi>(() => ListApi(Get.find<Dio>()));

    Get.lazyPut<ListViewModel>(() => ListViewModel());
    Get.lazyPut<DetailViewModel>(() => DetailViewModel());
  }

  Dio _buildDio() {
    final _dio = Dio();
    _dio.interceptors.add(DioInterceptor());

    return _dio;
  }
}