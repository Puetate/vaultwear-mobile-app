import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';
import 'package:vualtwear_mobile_app/src/domain/datasources/order_content_datasource.dart';
import 'package:vualtwear_mobile_app/src/domain/repositories/order_content_repository.dart';

class OrderContentsRepositoryImpl implements OrderContentRepository {
  final OrderContentDatasource orderContentDatasource;

  OrderContentsRepositoryImpl({required this.orderContentDatasource});

  @override
  Future<ResponseResult> getOrderContentByPage(
    String orderDetailCode,
    int page,
  ) {
    return orderContentDatasource.getOrderContentByPage(orderDetailCode, page);
  }
}
