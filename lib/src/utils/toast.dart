import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

class ToastManager {
  static void showErrorToast(BuildContext context, String message) {
    ElegantNotification.error(
      height: 80,
      showProgressIndicator: false,
      position: Alignment.bottomCenter,
      animation: AnimationType.fromBottom,
      displayCloseButton: false,
      description: Text(message),
    ).show(context);
  }

  static void showSuccessToast(BuildContext context, String message) {
    ElegantNotification.success(
      height: 80,
      showProgressIndicator: false,
      position: Alignment.bottomCenter,
      animation: AnimationType.fromBottom,
      displayCloseButton: true,
      description: Text(message),
    ).show(context);
  }

  static void showWarningToast(BuildContext context, String message) {
    ElegantNotification.info(
      height: 80,
      showProgressIndicator: false,
      position: Alignment.bottomCenter,
      animation: AnimationType.fromBottom,
      displayCloseButton: false,
      description: Text(message),
    ).show(context);
  }
}
