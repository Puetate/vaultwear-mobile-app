import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/Video/fullscreen_player.dart';
import 'package:vualtwear_mobile_app/src/components/VideoPlayer/video_buttons.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/utils/app_layout.dart';

class VideoScrollableView extends StatelessWidget {
  final List<OrderContent> contentList;
  const VideoScrollableView({super.key, required this.contentList});

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/images/rumi_font.png',
          width: size.width * 0.3,
        ),
        elevation: 0,
        toolbarHeight: kToolbarHeight + 20,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.0, 1.0],
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          final OrderContent content = contentList[index];
          return Stack(
            children: [
              SizedBox.expand(
                child: 
                FullscreenPlayer(
                  urlVideo: content.urlContent,
                  caption: content.contentDescription,
                ),
              ),

              Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(content: content),
              ),
            ],
          );
        },
      ),
    );
  }
}
