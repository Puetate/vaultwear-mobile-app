import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:vualtwear_mobile_app/src/components/Onboarding/onboarding_screen.dart';
import 'package:vualtwear_mobile_app/src/domain/infrastructure/datasources/local_order_content_datasource_impl.dart';
import 'package:vualtwear_mobile_app/src/domain/infrastructure/repositories/order_contents_repository_impl.dart';
import 'package:vualtwear_mobile_app/src/global/navigator.dart';
import 'package:vualtwear_mobile_app/src/screens/Content/screens/content_screen.dart';
import 'package:vualtwear_mobile_app/src/screens/Content/view_model/content_viewmodel.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/view_model/home_viewmodel.dart';
import 'package:vualtwear_mobile_app/src/theme/theme_provider.dart';
import 'package:vualtwear_mobile_app/src/utils/shared_preferences.dart';

Future<void> main() async {
  await dotenv.load();
  await SharedPrefs().init();

  final orderContentRepository = OrderContentsRepositoryImpl(
    orderContentDatasource: LocalOrderContentDatasourceImpl(),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(
          create:
              (context) => ContentViewmodel(
                orderContentRepository: orderContentRepository,
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool showOnboarding = !sharedPrefs.openOnBoarding;
    return MaterialApp(
      navigatorKey: NavigatorHelper.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:
          showOnboarding
              ? OnboardingScreen(
                onPressed: () {
                  context.read<ThemeProvider>().toggleTheme();
                },
              )
              : ContentScreen(),
      theme: context.watch<ThemeProvider>().themeData,
    );
  }
}
