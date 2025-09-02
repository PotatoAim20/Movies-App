import 'package:dio/dio.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio(BaseOptions(baseUrl: 'https://yts.mx/api/'));
    dio.interceptors.add(LogInterceptor(request: true, responseBody: true));
  }

  Future<Response> getApi(String endpoint, Map<String, dynamic> query) async {
    var result = await dio.get(endpoint, queryParameters: query);
    print("🔄 Raw Response: ${result.data}");
    return result;
  }
}
