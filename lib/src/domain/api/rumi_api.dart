import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/domain/api/response_result.dart';
import 'package:vualtwear_mobile_app/src/domain/api/dio.config.dart';
import 'package:vualtwear_mobile_app/src/domain/models/error/error_message.dart';
import 'package:vualtwear_mobile_app/src/utils/constants.dart';

class Api {
  static final Dio _dio = DioSingleton.getInstance();

  static Future<Object> httpGet(String path) async {
    try {
      return await _dio
          .get(
            path,
          )
          .then((value) => (Success(response: value.data)));
    } on DioException catch (e) {
      return Failure(errorResponse: errorMessages[e.type]!);
    } catch (er) {
      return Failure(errorResponse: errorMessages[DioExceptionType.unknown]!);
    }
  }

  static Future<ResponseResult> get(String path,
      [Map<String, dynamic>? data]) async {
    try {
      return await _dio
          .get(
            path,
            data: data,
          )
          .then((value) => (ResponseResult(data: value.data)));
    } on DioException catch (e) {
      final String message =
          e.response?.data['error'] ?? errorMessages[e.type]!;
      return ResponseResult(
          data: null, hasError: true, error: ErrorMessage(message: message));
    } catch (er) {
      log(er.toString());
      return ResponseResult(
          data: null,
          hasError: true,
          error:
              ErrorMessage(message: errorMessages[DioExceptionType.unknown]!));
    }
  }

  static Future<ResponseResult> post(
      String path, Map<String, dynamic> data) async {
    try {
      return await _dio
          .post(path, data: data)
          .then((value) => (ResponseResult(data: value.data)));
    } on DioException catch (e) {
      final String message =
          e.response?.data['error'] ?? errorMessages[e.type]!;
      // return Failure(errorResponse: message) as ResponseResult<T>;
      return ResponseResult(
          data: null, hasError: true, error: ErrorMessage(message: message));
    } catch (er) {
      return ResponseResult(
          data: null,
          hasError: true,
          error:
              ErrorMessage(message: errorMessages[DioExceptionType.unknown]!));
    }
  }

  static Future postWithFile(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data, ListFormat.pipes);
    return await _dio
        .post(path, data: formData)
        .then((value) => (ResponseResult(data: value.data, hasError: false)))
        .catchError((err) {
      debugPrint(err.toString());
      return (ResponseResult(data: Null, hasError: true));
    }).onError((err, stackTrace) {
      debugPrint(err.toString());
      return (ResponseResult(data: null, hasError: true));
    });
  }

  static Future<ResponseResult> patch(String path, Object? data) async {
    try {
      return await _dio
          .patch(path, data: data)
          .then((value) => (ResponseResult(data: value.data, hasError: false)));
    } on DioException catch (e) {
      final String message =
          e.response?.data['error'] ?? errorMessages[e.type]!;
      // return Failure(errorResponse: message) as ResponseResult<T>;
      return ResponseResult(
          data: null, hasError: true, error: ErrorMessage(message: message));
    } catch (er) {
      return ResponseResult(
          data: null,
          hasError: true,
          error:
              ErrorMessage(message: errorMessages[DioExceptionType.unknown]!));
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    final resp = await _dio.delete(path, data: formData);
    return resp.data;
  }

}
