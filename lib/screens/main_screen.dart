import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc_provider.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/components/favorite_list_widget.dart';
import 'package:mobile_buyer_flutter/components/phone_list_widget.dart';
import 'package:mobile_buyer_flutter/constants.dart';
import 'package:mobile_buyer_flutter/data_layer/sort_type.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Mobiles"),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () async {
                final sortedBy = await showConfirmationDialog<SortType>(
                    context: context,
                    title: 'Sort',
                    actions: [
                      const AlertDialogAction(key: SortType.lowestPrice, label: kSortByLowestPrice),
                      const AlertDialogAction(key: SortType.highestPrice, label: kSortByHighestPrice),
                      const AlertDialogAction(key: SortType.rating, label: kSortByRating),
                    ],
                );
                if(sortedBy != null) {
                  //in order to refresh the fav button
                  BlocProvider.of<PhoneBloc>(context).updateSortedList(sortedBy);
                  BlocProvider.of<FavoriteBloc>(context).updateSortedList(sortedBy);
                }
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
    );
  }
}
