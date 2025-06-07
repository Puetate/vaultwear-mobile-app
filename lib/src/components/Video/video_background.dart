import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  final AlignmentGeometry end;
  const VideoBackground({
    super.key,
    this.colors = const [Colors.transparent, Colors.black],
    this.stops = const [0.0, 1.0],
    this.end = Alignment.bottomCenter,
  }) : assert(
         colors.length == stops.length,
         'Stops and Colors must be Same Length',
       );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors, stops: stops,
          begin: Alignment.topCenter, end: end),
        ),
      ),
    );
  }
}
