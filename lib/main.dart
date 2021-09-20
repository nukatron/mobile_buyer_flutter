import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc_provider.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/screens/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneBloc>(
      bloc: PhoneBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );
  }
}

