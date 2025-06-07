import 'package:vualtwear_mobile_app/src/domain/api/endpoints.dart';
import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';
import 'package:vualtwear_mobile_app/src/domain/api/rumi_api.dart';
import 'package:vualtwear_mobile_app/src/domain/datasources/order_content_datasource.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/domain/infrastructure/models/dto/order_content_model.dart';

class LocalOrderContentDatasourceImpl implements OrderContentDatasource {
  @override
  Future<ResponseResult<dynamic>> getOrderContentByPage(
    String orderDetailCode,
    int page,
  ) async {
    ResponseResult res = await Api.get(
      "${EndPoints.getOrderContent}/$orderDetailCode",
    );

    if (res.error != null) {
      return ResponseResult(data: null, error: res.error);
    }

    final List<OrderContent> newVideos =
        res.data
            .map(
              (content) =>
                  OrderContentModel.fromJson(
                    content,
                  ).toOrderContentEntity(),
            )
            .toList();

    return ResponseResult(data: newVideos, error: null);
  }
}
