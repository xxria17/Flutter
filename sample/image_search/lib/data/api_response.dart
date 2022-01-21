import 'package:image_search/data/model/meta_data.dart';

abstract class ApiResponse<T> {
  MetaData? metaData;
  T? data;
}