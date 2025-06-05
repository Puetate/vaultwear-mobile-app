// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_order_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalOrderContentModel _$LocalOrderContentModelFromJson(
  Map<String, dynamic> json,
) => LocalOrderContentModel(
  videoUrl: json['videoUrl'] as String,
  contentTypeName: json['contentTypeName'] as String? ?? "VIDEO",
  name: json['name'] as String? ?? "DESCRIPTION NOT PROVIDED",
);

Map<String, dynamic> _$LocalOrderContentModelToJson(
  LocalOrderContentModel instance,
) => <String, dynamic>{
  'videoUrl': instance.videoUrl,
  'contentTypeName': instance.contentTypeName,
  'name': instance.name,
};
