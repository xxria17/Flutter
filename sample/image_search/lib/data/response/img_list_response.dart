import 'package:image_search/data/model/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';
import '../api_response.dart';
import '../model/image_data.dart';

part 'img_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ImgListResponse implements ApiResponse {
  ImgListResponse({this.data});

  @override
  @JsonKey(name: "documents")
  List<Images>? data;

  @override
  @JsonKey(name: "meta")
  MetaData? metaData;

  factory ImgListResponse.fromJson(Map<String, dynamic> json) => _$ImgListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImgListResponseToJson(this);
}