import 'dart:convert';

ErrorMessage userErrorFromJson(String str) =>
    ErrorMessage.fromJson(json.decode(str));

String userErrorToJson(ErrorMessage data) => json.encode(data.toJson());

class ErrorMessage {
  ErrorMessage({
    required this.message,
  });

  String message;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
