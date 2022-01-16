import 'package:dio/dio.dart';
import 'package:flutter_mvvm/core/network/app_exceptions.dart';
import 'package:flutter_mvvm/core/network/network_request.dart';

class NetworkLayer {
  final Dio _dio = Dio(BaseOptions(receiveTimeout: 5000, sendTimeout: 10000));

  NetworkLayer() {}

  dynamic get(NetworkReqest reqest) async {
    Response response = await _dio.get(reqest.path);
    return _returnResponse(response);
  }

  dynamic post(NetworkReqest request) async {
    Response response = await _dio.post(request.path);
    return _returnResponse(response);
  }
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
