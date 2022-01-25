import 'package:image_search/data/model/meta_data.dart';

import 'model/image_data.dart';

abstract class ApiResponse {
  MetaData? metaData;
  List<Images>? data;
}