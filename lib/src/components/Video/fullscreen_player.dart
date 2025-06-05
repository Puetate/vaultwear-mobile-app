import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vualtwear_mobile_app/src/components/Video/video_background.dart';
import 'package:vualtwear_mobile_app/src/utils/utils.dart';

class FullscreenPlayer extends StatefulWidget {
  final String urlVideo;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.urlVideo,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.networkUrl(widget.urlVideo)
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://videos.pexels.com/video-files/4058084/4058084-uhd_1440_2732_25fps.mp4',
            ),
          )
          ..setVolume(0)
          ..setLooping(true)
          ..play()
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? FutureBuilder(
          future: controller.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }
            return GestureDetector(
              onTap: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                  return;
                }
                controller.play();
              },
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(controller),
                    VideoBackground(stops: const [0.8, 1.0]),
                    Positioned(bottom: 50, left: 20, child: Center()),
                  ],
                ),
              ),
            );
          },
        )
        : Center(child: CircularProgressIndicator());
  }
}

class VideoCaption extends StatelessWidget {
  final String caption;
  const VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    final tileStyle = Theme.of(context).textTheme.titleMedium;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
