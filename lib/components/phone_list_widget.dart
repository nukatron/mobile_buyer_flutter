import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc_provider.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/components/mobile_tile_widget.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class PhoneListWidget extends StatelessWidget {
  const PhoneListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Phone>>(
        stream: BlocProvider.of<PhoneBloc>(context).phoneStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final phones = snapshot.data!;
            return ListView.separated(
              itemCount: phones.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final phone = phones[index];
                return MobileTileWidget(phone: phone);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          // By default, show a loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
