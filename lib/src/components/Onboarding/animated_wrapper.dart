import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedWrapper extends StatelessWidget {
  final int index;
  final int delayPerItem;
  final int duration;
  final Widget child;

  const AnimatedWrapper({
    super.key,
    required this.index,
    required this.child,
    this.delayPerItem = 150,
    this.duration = 400,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 30,
      delay: Duration(milliseconds: index * delayPerItem),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}
