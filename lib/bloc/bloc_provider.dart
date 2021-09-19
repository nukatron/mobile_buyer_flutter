
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {

  final Widget child;
  final BaseBloc bloc;

  const BlocProvider({Key? key, required this.bloc, required this.child}) : super(key: key);

  static T of<T extends BaseBloc>(BuildContext context) {
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc as T;
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
