import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/Video/fullscreen_player.dart';
import 'package:vualtwear_mobile_app/src/components/VideoPlayer/video_buttons.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';

class VideoScrollableView extends StatelessWidget {
  final List<OrderContent> contentList;
  const VideoScrollableView({super.key, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: contentList.length,
      itemBuilder: (context, index) {
        final OrderContent content = contentList[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullscreenPlayer(
                urlVideo: content.urlContent,
                caption: content.contentDescription,
              ),
            ),
            Positioned(
              bottom: 15,
              right: 5,
              child: VideoButtons(content: content),
            ),
          ],
        );
      },
    );
  }
}
