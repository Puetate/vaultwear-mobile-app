import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';

class VideoButtons extends StatelessWidget {
  final OrderContent content;
  const VideoButtons({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_CustomIconButton(value: 0, iconData: Icons.send)],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color),
          iconSize: 30,
        ),
        Text("Compartir", style: style),
        // Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
