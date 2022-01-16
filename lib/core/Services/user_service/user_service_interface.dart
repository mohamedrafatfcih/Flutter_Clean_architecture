import 'package:flutter_mvvm/core/model/user/user.dart';

abstract class UserServiceInterface {
  Future<List<User>> fetchUsersList();
}
