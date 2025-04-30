import 'package:flutter/cupertino.dart';

final List<Color> _featuresColors = [
  CupertinoColors.systemBlue,
  CupertinoColors.systemGreen,
  CupertinoColors.systemOrange,
  CupertinoColors.systemPurple,
  CupertinoColors.systemTeal,
];

class InfoPageOnboarding {
  final IconData icon;
  final String title;
  final String desc;
  final int index;

  InfoPageOnboarding({
    required this.icon,
    required this.title,
    required this.desc,
    required this.index,
  });
}

final List<InfoPageOnboarding> welcomePage = [
  InfoPageOnboarding(
    index:1,
    icon: CupertinoIcons.qrcode,
    title: "Scan",
    desc:
        "Sint officia do eu sit in laboris exercitation. Proident magna sit cupidatat esse esse occaecat anim. Cupidatat cupidatat labore et sit nisi eiusmod minim nisi nulla irure nostrud.",
  ),
  InfoPageOnboarding(
    index:2,
    icon: CupertinoIcons.shield_fill,
    title: "Scan",
    desc:
        "Sint officia do eu sit in laboris exercitation. Proident magna sit cupidatat esse esse occaecat anim. Cupidatat cupidatat labore et sit nisi eiusmod minim nisi nulla irure nostrud.",
  ),
  InfoPageOnboarding(
    index:3,
    icon: CupertinoIcons.videocam_circle_fill,
    title: "Scan",
    desc:
        "Sint officia do eu sit in laboris exercitation. Proident magna sit cupidatat esse esse occaecat anim. Cupidatat cupidatat labore et sit nisi eiusmod minim nisi nulla irure nostrud.",
  ),
];

Icon coloredIcon(IconData icon, int index) {
  return Icon(
    icon,
    color: _featuresColors[index % _featuresColors.length],
    size: 28,
  );
}
