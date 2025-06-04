import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vualtwear_mobile_app/src/components/app_error.dart';
import 'package:vualtwear_mobile_app/src/components/app_loading.dart';
import 'package:vualtwear_mobile_app/src/domain/models/dto/order_content.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/switch_type.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/view_model/home_viewmodel.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel orderViewModel = context.watch<HomeViewModel>();
    return Scaffold(body: _ui(orderViewModel));
  }

  Widget _ui(HomeViewModel orderViewModel) {
    if (orderViewModel.loading) {
      return ListView(children: const [AppLoading()]);
    }
    if (orderViewModel.errorMessage != null) {
      return ListView(
        children: [AppError(errorText: orderViewModel.errorMessage!.message)],
      );
    }

    OrderContent content = orderViewModel.orderContentModel!;

    return SwitchType(
      type: content.contentTypeName,
      urlContent: content.urlContent,
    );
  }
}
