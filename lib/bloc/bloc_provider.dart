
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider({
    Key? key,
    this.child,
    this.shouldDispose = true,
    required this.bloc,
  }) : super(key: key);

  final Widget? child;
  final T bloc;
  final bool shouldDispose;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends Bloc>(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>();
    final provider = (element!.widget as _BlocProviderInherited<T>);
    return provider.bloc;
  }

  BlocProvider<T> copyWithChild(Widget child) {
    return BlocProvider<T>(
      bloc: bloc,
      key: key,
      child: child,
    );
  }
}

class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    if (widget.shouldDispose) {
      widget.bloc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child ?? Container(),
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
