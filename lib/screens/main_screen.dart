import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc_provider.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/components/mobile_list_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: TabBarView(
          children: [
            MobileListWidget(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
