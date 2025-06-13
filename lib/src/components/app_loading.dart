import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(child: Lottie.asset('assets/lotties/app-load.json'));
    return Center(child: Pulse(infinite: true, child: LoadingAnimationWidget.fourRotatingDots(color: Colors.white, size: 50)));
  }
}
