import 'package:dio/src/options.dart';
import 'package:dio/src/cancel_token.dart';
import 'package:flutter_mvvm/core/network/network_request.dart';

class FackNetworkRequest implements NetworkReqest {
  @override
  CancelToken? cancelToken;

  @override
  ContentEncoding contentEncoding;

  @override
  Map<String, String>? headers;

  @override
  HttpMethod method;

  @override
  void Function(int p1, int p2)? onReceiveProgress;

  @override
  void Function(int p1, int p2)? onSendProgress;

  @override
  Options? options;

  @override
  Map<String, dynamic>? parameters;

  @override
  String path;

  @override
  // TODO: implement queryParameters
  String get queryParameters => "";

  FackNetworkRequest(
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
