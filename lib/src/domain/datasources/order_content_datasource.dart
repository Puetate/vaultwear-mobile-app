import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';

abstract class OrderContentDatasource {
  Future<ResponseResult<dynamic>> getOrderContentByPage(
    String orderDetailCode,
    int page,
  );
}
