import 'package:json_annotation/json_annotation.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';

part 'order_content_model.g.dart';

@JsonSerializable()
class OrderContentModel {
  @JsonKey(name: "contentTypeID")
  int contentTypeId;
  @JsonKey(name: "contentTypeName")
  String contentTypeName;
  @JsonKey(name: "urlContent")
  String urlContent;
  @JsonKey(name: "description")
  String description;

  OrderContentModel({
    required this.contentTypeId,
    required this.contentTypeName,
    required this.urlContent,
    required this.description,
  });

  factory OrderContentModel.fromJson(Map<String, dynamic> json) =>
      _$OrderContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderContentModelToJson(this);

  OrderContent toOrderContentEntity() => OrderContent(
    urlContent: urlContent,
    contentTypeName: contentTypeName,
    contentDescription: description,
  );
}
