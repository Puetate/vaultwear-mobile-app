
import 'package:json_annotation/json_annotation.dart';

part 'order_content.g.dart';
@JsonSerializable()
class OrderContent {
    @JsonKey(name: "urlContent")
    String urlContent;
    @JsonKey(name: "contentTypeName")
    String contentTypeName;

    OrderContent({
        required this.urlContent,
        required this.contentTypeName,
    });

    factory OrderContent.fromJson(Map<String, dynamic> json) => _$OrderContentFromJson(json);

    Map<String, dynamic> toJson() => _$OrderContentToJson(this);
}
