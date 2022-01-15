import 'package:flutter/material.dart';
import 'package:flutter_mvvm/UI/view/user_list_view.dart';
import 'package:flutter_mvvm/locator.dart';

void main() {
  LocatorManager.instance.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserList(),
    );
  }
}
