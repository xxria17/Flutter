// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      json['image_url'] as String?,
      json['thumbnail_url'] as String?,
      json['display_sitename'] as String?,
      json['datetime'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'image_url': instance.imgUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'display_sitename': instance.siteName,
      'datetime': instance.dateTime,
    };
