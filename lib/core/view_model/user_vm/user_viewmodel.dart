import 'package:flutter_mvvm/core/Services/user_service/user_service.dart';
import 'package:flutter_mvvm/core/model/user/user.dart';
import 'package:flutter_mvvm/core/view_model/base_vm/base_viewmodel.dart';
import 'package:flutter_mvvm/core/view_model/base_vm/view_state.dart';
import 'package:flutter_mvvm/core/view_model/user_vm/user_vm_interface.dart';

class UserViewModel extends BaseViewModel implements UserVMInterface {
  late UserService _userService;
  late List<User> _usersList;
  get usersList => _usersList;

  UserViewModel() {
    _userService = UserService();
  }

  void fetchUserList() async {
    updateViewState(ViewState.Busy);
    _usersList = await _userService.fetchUsersList();
    updateViewState(ViewState.Idle);
  }
}
