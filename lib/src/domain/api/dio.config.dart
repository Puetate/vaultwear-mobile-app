import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vualtwear_mobile_app/src/global/navigator.dart';
import 'package:vualtwear_mobile_app/src/utils/utils.dart';

class DioSingleton {
  static Dio? _instance;

  DioSingleton._internal() {
    // Configuración de Dio y sus interceptores
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        },
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // final token = await SecureStorageHelper().getToken;
          // options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException error, handler) {
          String notConnectMessage = errorMessages[error.type]!;
          final String message =
              error.response?.data['error'] ?? notConnectMessage;

          BuildContext? ctx = NavigatorHelper.navigatorKey.currentContext;
          ToastManager.showErrorToast(ctx!, message);

          handler.next(error);
        },
      ),
    );

    _instance = dio;
  }

  static Dio getInstance() {
    if (_instance == null) {
      DioSingleton._internal(); // Crear una instancia si es nula
    }
    return _instance!;
  }
}
