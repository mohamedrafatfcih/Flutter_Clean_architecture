import 'package:flutter_mvvm/core/Services/user_service/user_service_interface.dart';
import 'package:flutter_mvvm/core/model/user/user.dart';
import 'package:flutter_mvvm/core/network/api_base_paths.dart';
import 'package:flutter_mvvm/core/network/network_layer.dart';

class UserService implements UserServiceInterface {
  late final NetworkLayer _networkLayer;

  UserService() {
    _networkLayer = NetworkLayer();
  }

  Future<List<User>> fetchUsersList() async {
    final usersResponse =
        await _networkLayer.getReq(APIPathHelper.getValue(APIPath.UsersList));
    // Parse the users response.
    print(usersResponse);
    return [User()];
  }
}
