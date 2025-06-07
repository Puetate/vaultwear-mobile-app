// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderContentModel _$OrderContentModelFromJson(Map<String, dynamic> json) =>
    OrderContentModel(
      contentTypeId: (json['contentTypeID'] as num).toInt(),
      contentTypeName: json['contentTypeName'] as String,
      urlContent: json['urlContent'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$OrderContentModelToJson(OrderContentModel instance) =>
    <String, dynamic>{
      'contentTypeID': instance.contentTypeId,
      'contentTypeName': instance.contentTypeName,
      'urlContent': instance.urlContent,
      'description': instance.description,
    };
