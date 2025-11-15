import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  final dio = Dio();

  Future<dynamic> getData(String url) async {
    Response response;
    response = await dio.get(
      url,
      options: Options(
          headers: {"content-type": "application/json"},
          method: "GET",
          responseType: ResponseType.json),
    );
    // log(response.toString());
    return response;
  }
}
