import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/view_model/base_vm/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get viewState => _state;

  void updateViewState(ViewState newState) {
    _state = newState;
    notifyViews();
  }

  void notifyViews() {
    notifyListeners();
  }
}
