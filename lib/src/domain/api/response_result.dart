
import 'package:vualtwear_mobile_app/src/domain/infrastructure/models/error/error_message.dart';

class ResponseResult<T> {
  final T? data;
  final bool hasError;
  final ErrorMessage? error;

  ResponseResult({required this.data, this.hasError = false, this.error});
}

class Success {
  int? code;
  Object response;
  Success({this.code, required this.response});
}

class Failure {
  String errorResponse;
  Failure({required this.errorResponse});
}
