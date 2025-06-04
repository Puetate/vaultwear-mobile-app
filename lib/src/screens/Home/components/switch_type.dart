import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/ContentTypes/UrlType/url_type_widget.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/ContentTypes/VideoType/video_type_widget.dart';

final class SwitchType extends StatelessWidget {
  final String type;
  final String urlContent;
  const SwitchType({super.key, required this.type, required this.urlContent});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> contentTypes = {
      'VIDEO': YouTubeVideoWidget(urlContent: urlContent),
      'URL': UrlTypeWidget(urlContent: urlContent),
    };

    return contentTypes[type] ?? const Text('Tipo de contenido no soportado');
  }
}
