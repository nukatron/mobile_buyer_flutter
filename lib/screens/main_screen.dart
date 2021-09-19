import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/components/favorite_list_widget.dart';
import 'package:mobile_buyer_flutter/components/phone_list_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneBloc(),),
        BlocProvider(create: (_) => FavoriteBloc(),),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Mobiles"),
            actions: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  //TODO: go to fav page
                },
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Favorite'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PhoneListWidget(),
              FavoriteListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
