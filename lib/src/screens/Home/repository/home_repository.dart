import 'package:vualtwear_mobile_app/src/domain/api/endpoints.dart';
import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';
import 'package:vualtwear_mobile_app/src/domain/api/rumi_api.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/repository/home_interface.dart';

class HomeRepository extends HomeInterface {
  @override
  Future<ResponseResult> getOrderContent(String orderDetailCode) async {
    return await Api.get("${EndPoints.getOrderContent}/$orderDetailCode");
  }
  
}