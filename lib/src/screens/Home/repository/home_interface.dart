import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';

abstract class HomeInterface {
  Future<ResponseResult> getOrderContent(String orderDetailCode);
}
