import 'package:flutter/material.dart';
import 'package:flutter_mvvm/UI/view/base_view.dart';
import 'package:flutter_mvvm/core/view_model/base_vm/view_state.dart';
import 'package:flutter_mvvm/core/view_model/user_vm/user_viewmodel.dart';

class UserList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const UserList();

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
        onModelReady: (viewModel) => viewModel.fetchUserList(),
        builder: (context, viewModel, child) {
          if (viewModel.viewState == ViewState.Idle) {
            return Scaffold(
              body: Container(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
