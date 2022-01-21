// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      json['total_count'] as int?,
      json['pageable_count'] as int?,
      json['is_end'] as bool?,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'total_count': instance.totalCnt,
      'pageable_count': instance.pageableCnt,
      'is_end': instance.isEnd,
    };
