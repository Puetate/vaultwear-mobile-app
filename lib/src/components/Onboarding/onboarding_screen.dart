import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/Onboarding/animated_wrapper.dart';
import 'package:vualtwear_mobile_app/src/components/Onboarding/pages.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/screens/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onPressed;
  const OnboardingScreen({super.key, required this.onPressed});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            Theme.of(context).brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        ),
      ),
      body: CupertinoOnboarding(
        bottomButtonChild: Text("Continuar"),
        bottomButtonColor: CupertinoColors.activeBlue,
        onPressedOnLastPage: () {
          Navigator.of(
            context,
          ).pushReplacement(CupertinoPageRoute(builder: (_) => HomeScreen()));
        },
        pages: [_buildWelcomePage(), _buildWelcomePage()],
      ),
    );
  }

  _buildWelcomePage() {
    return WhatsNewPage(
      title: AnimatedWrapper(index: 1, child: Text("Escaneame!")),
      titleFlex: 3,
      features:
          welcomePage
              .map(
                (e) => AnimatedWrapper(
                  index: e.index,
                  child: WhatsNewFeature(
                    title: Text(e.title),
                    description: Text(e.desc),
                    icon: coloredIcon(e.icon, e.index),
                  ),
                ),
              )
              .toList(),
    );
  }
}
