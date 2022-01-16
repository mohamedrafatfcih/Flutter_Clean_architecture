import 'package:dio/dio.dart';
import 'package:flutter_mvvm/core/network/network_layer.dart';

class Enum<T> {
  final T value;
  const Enum(this.value);
}

class HttpMethod extends Enum<String> {
  const HttpMethod(String val) : super(val);

  static const HttpMethod GET = const HttpMethod('GET');
  static const HttpMethod POST = const HttpMethod('POST');
  static const HttpMethod PUT = const HttpMethod('PUT');
  static const HttpMethod DELETE = const HttpMethod('DELETE');
}

enum ContentEncoding { url, json }

class NetworkReqest {
  String path;
  Options? options;
  HttpMethod method;
  Map<String, String>? headers;
  Map<String, dynamic>? parameters;
  ContentEncoding contentEncoding;
  CancelToken? cancelToken;
  void Function(int, int)? onSendProgress;
  void Function(int, int)? onReceiveProgress;

  String get queryParameters {
    if (method == HttpMethod.GET) {
      final jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    }
    return '';
  }

  NetworkReqest(
    this.path, {
    this.method = HttpMethod.GET,
    this.headers = const {},
    this.parameters = const {},
    this.contentEncoding = ContentEncoding.json,
    this.options,
    this.cancelToken,
    this.onSendProgress,
    this.onReceiveProgress,
  });
}
