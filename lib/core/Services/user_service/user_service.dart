import 'package:flutter_mvvm/core/Services/user_service/user_service_interface.dart';
import 'package:flutter_mvvm/core/model/user/user.dart';
import 'package:flutter_mvvm/core/network/api_base_paths.dart';
import 'package:flutter_mvvm/core/network/network_layer.dart';
import 'package:flutter_mvvm/core/network/network_request.dart';

class UserService implements UserServiceInterface {
  late final NetworkLayer _networkLayer;

  UserService() {
    _networkLayer = NetworkLayer();
  }

  @override
  Future<List<User>> fetchUsersList() async {
    final _request = NetworkReqest(APIPathHelper.getValue(APIPath.UsersList));

    final usersResponse = await _networkLayer.get(_request);
    // Parse the users response.
    print(usersResponse);
    return [User()];
  }
}
