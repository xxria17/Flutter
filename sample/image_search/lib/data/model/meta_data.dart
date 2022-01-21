import 'package:json_annotation/json_annotation.dart';

part 'meta_data.g.dart';

@JsonSerializable(explicitToJson: true)
class MetaData {

  @JsonKey(name: "total_count")
  int? totalCnt;
  @JsonKey(name: "pageable_count")
  int? pageableCnt;
  @JsonKey(name: "is_end")
  bool? isEnd;

  MetaData(this.totalCnt, this.pageableCnt, this.isEnd);

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}