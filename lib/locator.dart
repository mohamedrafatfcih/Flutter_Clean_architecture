import 'package:flutter_mvvm/core/view_model/user_vm/user_viewmodel.dart';
import 'package:get_it/get_it.dart';

class LocatorManager {
  static LocatorManager instance = LocatorManager._();
  static GetIt global = GetIt.instance;
  LocatorManager._();

  void setup() {
    global.registerFactory(() => UserViewModel());
  }
}
