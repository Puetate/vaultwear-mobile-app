import 'package:json_annotation/json_annotation.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';

part 'local_order_content_model.g.dart';

@JsonSerializable()
class LocalOrderContentModel {
  @JsonKey(name: "videoUrl")
  final String videoUrl;
  @JsonKey(name: "contentTypeName")
  final String contentTypeName;
  @JsonKey(name: "name")
  final String name;

  LocalOrderContentModel({
    required this.videoUrl,
    this.contentTypeName = "VIDEO",
    this.name = "DESCRIPTION NOT PROVIDED",
  });

  factory LocalOrderContentModel.fromJson(Map<String, dynamic> json) =>
      _$LocalOrderContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalOrderContentModelToJson(this);

  OrderContent toOrderContentEntity() => OrderContent(
    urlContent: videoUrl,
    contentTypeName: contentTypeName,
    contentDescription: name,
  );
}
