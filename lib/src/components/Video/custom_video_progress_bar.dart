import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoProgressBar extends StatelessWidget {
  final YoutubePlayerController controller;
  final Duration position;
  final Duration duration;
  final hadVisibility = false;

  const CustomVideoProgressBar({
    super.key,
    required this.controller,
    required this.position,
    required this.duration,
  });

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Tiempos
        if (hadVisibility)
          Positioned(
            left: 10,
            bottom: 25,
            child: Text(
              _formatDuration(position),
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        if (hadVisibility)
          Positioned(
            right: 10,
            bottom: 25,
            child: Text(
              _formatDuration(duration),
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        // Barra de progreso
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2.5,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
              activeTrackColor: Colors.grey,
              inactiveTrackColor: Colors.white24,
              thumbColor: Colors.grey,
            ),
            child: Slider(
              min: 0,
              max: duration.inSeconds.toDouble().clamp(1, double.infinity),
              value: position.inSeconds.toDouble().clamp(
                0,
                duration.inSeconds.toDouble(),
              ),
              onChanged: (value) {
                controller.seekTo(Duration(seconds: value.toInt()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
