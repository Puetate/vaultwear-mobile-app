import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/Video/custom_video_progress_bar.dart';
import 'package:vualtwear_mobile_app/src/components/Video/video_background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vualtwear_mobile_app/src/utils/utils.dart';

class FullscreenPlayer extends StatefulWidget {
  final String urlVideo;
  final String caption;
  final VoidCallback? onSwipeUp;
  final VoidCallback? onSwipeDown;

  const FullscreenPlayer({
    super.key,
    required this.urlVideo,
    required this.caption,
    this.onSwipeUp,
    this.onSwipeDown,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late YoutubePlayerController _controller;
  bool isPlaying = true;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.urlVideo);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
        hideControls: true,
        disableDragSeek: true,
        hideThumbnail: true,
        enableCaption: false,
        showLiveFullscreenButton: false,
      ),
    );
    _controller.addListener(() {
      if (mounted) {
        setState(() {
          _position = _controller.value.position;
          _duration = _controller.value.metaData.duration;
        });
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        progressIndicatorColor: const Color.fromARGB(255, 243, 31, 31),
        bottomActions: const [],
      ),
      builder: (context, player) {
        return GestureDetector(
          onTap: _togglePlayPause,
          onVerticalDragUpdate: (details) {
            onDragUpdate(details);
          },
          behavior: HitTestBehavior.opaque,
          child: Stack(
            children: [
              Positioned.fill(child: player),
              VideoBackground(stops: const [0.8, 1.0]),
              Positioned(
                bottom: 50,
                left: 20,
                child: VideoCaption(caption: widget.caption),
              ),
              CustomVideoProgressBar(
                controller: _controller,
                position: _position,
                duration: _duration,
              ),

              if (!isPlaying)
                const Center(
                  child: Icon(Icons.pause, size: 80, color: Colors.white70),
                ).fadeOut(
                  duration: const Duration(milliseconds: 800),
                  animate: !isPlaying,
                ),
            ],
          ),
        );
      },
    );
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta! < -15) {
      widget.onSwipeUp?.call();
    } else if (details.primaryDelta! > 15) {
      widget.onSwipeDown?.call();
    }
  }
}

class VideoCaption extends StatelessWidget {
  final String caption;
  const VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        style: titleStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
