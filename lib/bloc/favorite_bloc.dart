import 'package:mobile_buyer_flutter/bloc/phone_bloc_base.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class FavoriteBloc extends PhoneBlocBase {

  List<Phone> get favoriteList => phones;

  FavoriteBloc() : super([]);

  void toggleFavorite(Phone phone) {
    if(phones.contains(phone)) {
      phones.removeWhere((item) => item.id == phone.id);
    } else {
      phones.add(phone);
    }
    emitItem(withSort: true);
  }
}