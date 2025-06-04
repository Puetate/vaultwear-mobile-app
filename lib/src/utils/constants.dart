// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String KEY_USER = "user";
const String KEY_TOKEN = "token";
// ignore: non_constant_identifier_names
String URL_IMG = dotenv.env['PUBLIC_IMG_URL']!;

//SuccessMessage
const String SUCCESS_REMEMBER_PASSWORD =
    "Se ha enviado un correo electrónico con la nueva contraseña.";

//ErrorMessages
Map<DioExceptionType, String> errorMessages = {
  DioExceptionType.connectionTimeout: "Tiempo de conexión agotado.",
  DioExceptionType.sendTimeout: "Tiempo de envío agotado.",
  DioExceptionType.receiveTimeout: "Tiempo de recepción agotado.",
  DioExceptionType.badCertificate: "Certificado incorrecto.",
  DioExceptionType.badResponse: "Respuesta incorrecta del servidor.",
  DioExceptionType.cancel: "Solicitud cancelada.",
  DioExceptionType.connectionError: "Error de conexión.",
  DioExceptionType.unknown: "Error Desconocido",
};

String getUrlImg(String? ownUrlImg, String generalUrlImg) {
  return (ownUrlImg) == null ? generalUrlImg : ownUrlImg;
}

String pluralize(String articleType) {
  if (articleType.endsWith('N') ||
      articleType.endsWith('L') ||
      articleType.endsWith('R')) {
    return '${articleType}ES';
  } else {
    return '${articleType}S';
  }
}
