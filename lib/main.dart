import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vualtwear_mobile_app/src/components/Onboarding/onboarding_screen.dart';
import 'package:vualtwear_mobile_app/src/theme/theme_provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OnboardingScreen(
        onPressed: () {
          context.read<ThemeProvider>().toggleTheme();
        },
      ),
      theme: context.watch<ThemeProvider>().themeData,
    );
  }
}
