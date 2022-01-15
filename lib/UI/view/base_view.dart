import 'package:flutter/material.dart';
import 'package:flutter_mvvm/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final void Function(T)? onModelReady;

  const BaseView({Key? key, required this.builder, this.onModelReady})
      : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  final viewModel = LocatorManager.global<T>();
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<T>(builder: widget.builder));
  }
}
