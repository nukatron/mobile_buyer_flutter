import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/screens/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneBloc(),),
        BlocProvider(create: (_) => FavoriteBloc(),),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}

