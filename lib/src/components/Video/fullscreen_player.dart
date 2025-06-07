import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/Video/video_background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
  late YoutubePlayerController _controller;
  bool isPlaying = true;

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
        progressIndicatorColor: Colors.white,
        bottomActions: const [],
      ),
      builder: (context, player) {
        return GestureDetector(
          onTap: _togglePlayPause,
          child: Stack(
            children: [
              Positioned.fill(child: player),              
              VideoBackground(stops: const [0.8, 1.0]),

              Positioned(
                bottom: 50,
                left: 20,
                child: VideoCaption(caption: widget.caption),
              ),
              // Puedes mostrar un ícono de pausa/reproducción si quieres feedback visual
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
