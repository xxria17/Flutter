// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImgListResponse _$ImgListResponseFromJson(Map<String, dynamic> json) =>
    ImgListResponse(
      data: (json['documents'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..metaData = json['meta'] == null
        ? null
        : MetaData.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$ImgListResponseToJson(ImgListResponse instance) =>
    <String, dynamic>{
      'documents': instance.data?.map((e) => e.toJson()).toList(),
      'meta': instance.metaData?.toJson(),
    };
