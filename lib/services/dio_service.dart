import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  final dio = Dio();

  Future<dynamic> getData(String url) async {
    Response response;
    try {
      response = await dio.get(
        url,
        options: Options(
            headers: {"content-type": "application/json"},
            method: "GET",
            responseType: ResponseType.json),
      );

      return response;
    } on DioException catch (e) {
      throw Exception("خطا در دریافت اطلاعات از سرور");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postData(Map<String, dynamic> map, String url) async {
    try {
      Response response = await dio.post(
        url,
        data: dio_service.FormData.fromMap(map),
        options: Options(
          // headers: {
          //   "Authorization": "Bearer token_here",
          // },
          method: "POST",
          responseType: ResponseType.json,
        ),
      );

      log('Response: ${response.data}');

      return response.data;
    } on DioException catch (e) {
      log('Error: ${e.message}');

      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
