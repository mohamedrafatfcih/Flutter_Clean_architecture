import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "https://jsonplaceholder.typicode.com";
    } else {
      return "https://jsonplaceholder.typicode.com";
    }
  }
}

enum APIPath {
  UsersList,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.UsersList:
        return "${APIBase.baseURL}/users";
      default:
        return "";
    }
  }
}
