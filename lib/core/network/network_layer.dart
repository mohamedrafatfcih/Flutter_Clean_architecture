import 'package:dio/dio.dart';
import 'package:flutter_mvvm/core/network/app_exceptions.dart';

class NetworkLayer {
  final Dio _dio = Dio();

  dynamic getReq(String url,
      {Map<String, String>? headers, Map<String, String>? parameters}) async {
    Response response = await _dio.get(url);
    return _returnResponse(response);
  }

  dynamic postReq(String url, dynamic data) async {
    Response response = await _dio.post(url);
    return _returnResponse(response);
  }
}

String queryParameters(Map<String, String> params) {
  if (params != null) {
    final jsonString = Uri(queryParameters: params);
    return '?${jsonString.query}';
  }
  return '';
}

dynamic _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.statusMessage);
    case 401:
    case 403:
      throw UnauthorisedException(response.statusMessage);
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
