import 'package:json_annotation/json_annotation.dart';

part 'image_data.g.dart';

@JsonSerializable(explicitToJson: true)
class Images {
  Images({this.imgUrl, this.thumbnailUrl, this.siteName, this.datetime});

  @JsonKey(name: "collection")
  String? collection;
  @JsonKey(name: "datetime")
  String? datetime;
  @JsonKey(name: "display_sitename")
  String? siteName;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "image_url")
  String? imgUrl;
  @JsonKey(name: "thumbnail_url")
  String? thumbnailUrl;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "doc_url")
  String? docUrl;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}