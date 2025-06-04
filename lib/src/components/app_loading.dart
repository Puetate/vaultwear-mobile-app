import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(child: Lottie.asset('assets/lotties/app-load.json'));
    return Center(child: Bounce(child: Text("data")));
  }
}
