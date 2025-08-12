import 'package:dio/dio.dart';

class DioService {
  Future<dynamic>  getMethod(String url) async {
    Response response;
    Dio dio = Dio();
    response = await dio.get(
      url,
      options: Options(
          headers: {"contenttype": "application/json"},
          responseType: ResponseType.json,
          method: "GET"),
    );
    return response;
  }
}
