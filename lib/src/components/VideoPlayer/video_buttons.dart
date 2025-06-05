import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/utils/human_formats.dart';

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
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color),
          iconSize: 30,
        ),
        Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
