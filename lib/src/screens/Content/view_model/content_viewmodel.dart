import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/domain/infrastructure/models/error/error_message.dart';
import 'package:vualtwear_mobile_app/src/domain/repositories/order_content_repository.dart';

class ContentViewmodel extends ChangeNotifier {
  final OrderContentRepository _orderContentRepository;

  bool _loading = false;

  List<OrderContent> _contentList = [];
  ErrorMessage? _errorMessage;

  ContentViewmodel({required OrderContentRepository orderContentRepository})
    : _orderContentRepository = orderContentRepository;

  bool get loading => _loading;
  List<OrderContent> get contentList => _contentList;

  ErrorMessage? get errorMessage => _errorMessage;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setContentList(List<OrderContent> list) {
    _contentList = list;
  }

  setErrorMessage(ErrorMessage? errorMessage) {
    _errorMessage = errorMessage;
  }

  Future<void> loadNextPage(String orderDetailCode) async {

    setLoading(true);
    setErrorMessage(null);

    final res = await _orderContentRepository
        .getOrderContentByPage(orderDetailCode, 1);

    if (res.hasError) {
      setErrorMessage(res.error!);
      setLoading(false);
      return;
    }

    setContentList(res.data);
    setLoading(false);
  }
}
