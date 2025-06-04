import 'package:flutter/material.dart';

class NavigatorHelper {
  NavigatorHelper._(); // Private constructor to prevent instantiation.

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigates to a new screen.
  static Future? to(String path) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Navigator.of(context).pushNamed(path);
    }
    return null;
  }

  // Pops all screens until reaching the first screen.
  static void popAll() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  // Replaces the current screen with a new screen.
  static void replaceAll(String screenID) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.of(context).pushReplacementNamed(screenID);
    }
  }

  static void removeUntil(String screenID) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(screenID, (route) => route.isFirst);
    }
  }

  // Pops the current screen.
  static void pop([dynamic data]) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.of(context).pop(data);
    }
  }

  static void popAlerts() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
