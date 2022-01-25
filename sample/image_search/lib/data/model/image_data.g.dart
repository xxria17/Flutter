// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      imgUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      siteName: json['display_sitename'] as String?,
      datetime: json['datetime'] as String?,
    )
      ..collection = json['collection'] as String?
      ..height = json['height'] as int?
      ..width = json['width'] as int?
      ..docUrl = json['doc_url'] as String?;

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'collection': instance.collection,
      'datetime': instance.datetime,
      'display_sitename': instance.siteName,
      'height': instance.height,
      'image_url': instance.imgUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'width': instance.width,
      'doc_url': instance.docUrl,
    };
