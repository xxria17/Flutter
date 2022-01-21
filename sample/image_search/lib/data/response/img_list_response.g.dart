// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImgListResponse _$ImgListResponseFromJson(Map<String, dynamic> json) =>
    ImgListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..metaData = json['metaData'] == null
        ? null
        : MetaData.fromJson(json['metaData'] as Map<String, dynamic>);

Map<String, dynamic> _$ImgListResponseToJson(ImgListResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'metaData': instance.metaData?.toJson(),
    };
