import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/domain/models/dto/local_order_content_model.dart';
import 'package:vualtwear_mobile_app/src/domain/models/error/error_message.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/repository/home_repository.dart';
import 'package:vualtwear_mobile_app/src/shared/data/local_video_post.dart';

class ContentViewmodel extends ChangeNotifier {
  final HomeRepository _orderRepository = HomeRepository();
  bool _loading = false;

  List<OrderContent> _contentList = [];
  ErrorMessage? _errorMessage;

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

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<OrderContent> newVideos =
        videoPosts
            .map(
              (video) =>
                  LocalOrderContentModel.fromJson(video).toOrderContentEntity(),
            )
            .toList();

    setContentList(newVideos);
    setLoading(false);
  }
}
