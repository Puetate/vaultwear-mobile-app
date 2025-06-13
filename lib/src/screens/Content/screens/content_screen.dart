import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vualtwear_mobile_app/src/components/VideoScrollableView/video_scrollable_view.dart';
import 'package:vualtwear_mobile_app/src/components/app_error.dart';
import 'package:vualtwear_mobile_app/src/components/app_loading.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/screens/Content/view_model/content_viewmodel.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/switch_type.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    ContentViewmodel orderViewModel = context.watch<ContentViewmodel>();
    return Scaffold(body: _ui(orderViewModel), backgroundColor: Colors.black);
  }

  Widget _ui(ContentViewmodel orderViewModel) {
    if (orderViewModel.loading) {
      return AppLoading();
    }
    if (orderViewModel.errorMessage != null) {
      return AppError(errorText: orderViewModel.errorMessage!.message);
    }

    List<OrderContent> contentList = orderViewModel.contentList;

    return SwitchType(type: contentList.first.contentTypeName, content: contentList);
  }
}
