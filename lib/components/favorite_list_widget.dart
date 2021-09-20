
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc_provider.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/components/mobile_tile_widget.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Phone>>(
      stream: BlocProvider.of<FavoriteBloc>(context).phoneStream,
      builder: (context, snapshot) {
        final phones = snapshot.data ?? <Phone>[];
        return ListView.separated(
              itemCount: phones.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder:  (context, index) {
                final phone = phones[index];
                return MobileTileWidget(phone: phone,);
              },
            );
      }
    );
  }
}
