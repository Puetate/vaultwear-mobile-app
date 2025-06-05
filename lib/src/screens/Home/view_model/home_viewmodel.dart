import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/domain/models/dto/local_order_content_model.dart';
import 'package:vualtwear_mobile_app/src/domain/models/error/error_message.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _orderRepository = HomeRepository();
  bool _loading = false;

  LocalOrderContentModel? _orderContentModel;
  ErrorMessage? _errorMessage;

  bool get loading => _loading;
  LocalOrderContentModel? get orderContentModel => _orderContentModel;
  ErrorMessage? get errorMessage => _errorMessage;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setOrderContentModel(LocalOrderContentModel? orderContentModel) {
    _orderContentModel = orderContentModel;
  }

  setErrorMessage(ErrorMessage? errorMessage) {
    _errorMessage = errorMessage;
  }

  Future<bool> getOrderContent(String orderDetailCode) async {
    setLoading(true);
    setErrorMessage(null);
    var res = await _orderRepository.getOrderContent(orderDetailCode);
    if (res.hasError) {
      setErrorMessage(res.error!);
      setLoading(false);
      return false;
    }
    LocalOrderContentModel orderContent = LocalOrderContentModel.fromJson(
      res.data,
    );
    // OrderContent orderContent = OrderContent(
    //   contentTypeName: "VIDEO",
    //   urlContent: "https://youtu.be/Xi1f-G8CTLI",
    // ); // Mock data for demonstration
    setOrderContentModel(orderContent);
    setLoading(false);
    return true;
  }
}
