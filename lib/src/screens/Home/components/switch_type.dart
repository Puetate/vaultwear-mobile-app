import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/VideoScrollableView/video_scrollable_view.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/ContentTypes/UrlType/url_type_widget.dart';

final class SwitchType extends StatelessWidget {
  final String type;
  final List<OrderContent> content;
  const SwitchType({super.key, required this.type, required this.content});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> contentTypes = {
      'VIDEO': VideoScrollableView(contentList: content),
      'URL': UrlTypeWidget(urlContent: content.first.urlContent),
    };

    return contentTypes[type] ?? const Text('Tipo de contenido no soportado');
  }
}
