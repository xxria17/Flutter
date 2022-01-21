import 'package:json_annotation/json_annotation.dart';

part 'image_data.g.dart';

@JsonSerializable(explicitToJson: true)
class Images {

  @JsonKey(name: "image_url")
  String? imgUrl;
  @JsonKey(name: "thumbnail_url")
  String? thumbnailUrl;
  @JsonKey(name: "display_sitename")
  String? siteName;
  @JsonKey(name: "datetime")
  String? dateTime;

  Images(this.imgUrl, this.thumbnailUrl, this.siteName, this.dateTime);

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}