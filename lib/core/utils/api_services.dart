import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    String? contanType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: {'Authorization': "Bearer $token"},
        contentType: contanType,
      ),
    );
    return response;
  }
}
