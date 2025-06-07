import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';
import 'package:vualtwear_mobile_app/src/domain/datasources/order_content_datasource.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/domain/infrastructure/models/dto/order_content_model.dart';
import 'package:vualtwear_mobile_app/src/shared/data/local_video_post.dart';

class LocalOrderContentDatasourceImpl implements OrderContentDatasource {
  @override
  Future<ResponseResult<dynamic>> getOrderContentByPage(
    String orderDetailCode,
    int page,
  ) async {

    final List<OrderContent> newVideos =
        videoPosts
            .map(
              (video) =>
                  OrderContentModel.fromJson(video).toOrderContentEntity(),
            )
            .toList();

    return ResponseResult(
      data: newVideos,
      error: null
    );
  }
}
